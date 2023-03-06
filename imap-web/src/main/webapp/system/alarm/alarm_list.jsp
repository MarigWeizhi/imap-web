<%--
  Created by IntelliJ IDEA.
  User: Weizhi
  Date: 2022/11/16
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<%--面包屑--%>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a><cite>系统管理</cite></a>
                <a><cite>告警管理</cite></a>
            </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>

<%--搜索栏--%>
<div class="layui-fluid">
    <div class="layui-row layui-col-space1">
        <div class="layui-col-md12">
            <div class="layui-card">
                <blockquote id="search" class="layui-elem-quote" style="position: relative;">
                    <div class="layui-card-body ">
                        <form class="layui-form layui-col-space5">
                            <div class="layui-inline">
                                <label class="layui-form-lab" style="width: auto">告警编号</label>
                                <input type="text" name="alarm_name" id="alarm_id" style="width: 180px;height: 32px;display: inline" placeholder="请输入告警编号" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <div style="float: left;padding-top: 5px;">
                                    <label class="layui-form-lab" style="width: auto">告警类型</label>
                                </div>
                                <div style="float: left;padding-left: 5px">
                                    <select name="status" id="status" style="width: 120px;height: 32px;" class="layui-input">
                                        <option value=""></option>
                                        <option value="0">温度异常</option>
                                        <option value="1">湿度异常</option>
                                        <option value="2">亮度异常</option>
                                        <option value="3">其他异常</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-sm"  lay-submit="" onclick="reloadData()"><i class="layui-icon">&#xe615;</i></button>
                            </div>
                        </form>
                    </div>
                </blockquote>
                <div class="layui-card-body ">
                    <table class="layui-hide" id="system_alarm" lay-filter="system_alarm"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<%--主功能区--%>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button type="button" class="layui-btn layui-btn-sm" lay-event="setStatus"><i class="layui-icon"></i>标记已处理</button>
    </div>
</script>

<%--每行数据操作--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="info">详情</a>
    <a class="layui-btn layui-btn-xs" lay-event="setStatus">标记已处理</a>
</script>

<%--表单逻辑--%>
<script>
    var table,form;
    layui.use(['table','form'], function(){
        table = layui.table;
        form = layui.form;

        table.render({
            elem: '#system_alarm'
            ,url:'${pageContext.request.contextPath}/system/alarm/findListPage'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'laytable_tips'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '告警数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left', width:40}
                ,{field:'alarm_id', width:80, fixed: 'left',title:'告警编号'}
                ,{field:'site_name',width:200, fixed: 'left',title:'站点名称', sort: true}
                ,{field:'type', width:120,title:'告警类型', fixed: 'left', sort: true, templet: function(res){
                        if(res.status=='0') return '温度异常';
                        if(res.status=='1') return '湿度异常';
                        if(res.status=='2') return '亮度异常';
                        if(res.status=='3') return '其他异常';
                        return '未知';}}
                ,{field:'create_time',width:220, fixed: 'left',title:'创建时间', sort: true}
                ,{field:'status',width:120, title:'状态', fixed: 'left', sort: true, templet: function(res){
                        if(res.status=='1') return '已处理';
                        if(res.status=='0') return '未处理';
                        return '未知';}}
                ,{fixed: 'right', align:'center',title:'操作', width:220, toolbar: '#barDemo'}
            ]]
            ,id:'system_alarm'
            ,page: true
            ,done: function (res, curr, count) {
            }
        });

        //头工具栏事件
        table.on('toolbar(system_alarm)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;
            switch(obj.event){
                case 'laytable_tips': //小提示
                    layer.msg("小提示：告警信息模块", {time: 2000});
                    break;
                case 'setStatus':
                    //批量标记为已处理
                    setStatus(data);
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(system_alarm)', function(obj){
            var data = obj.data;

            // 详情
            if(obj.event === 'info'){
                parent.layer.open({
                    title: '告警详情',
                    maxmin: true,
                    type: 2,
                    content: '${pageContext.request.contextPath}/system/alarm/info/'+data.alarm_id,
                    area: ['800px', '500px']
                });
            }

            if(obj.event === 'setStatus'){
                //标记单个id为已处理
                setStatus([{'alarm_id':data.alarm_id}])
            }
        });

    });

    function reloadData(){
        var alarm_name = $('#alarm_name').val();
        var status = $("#status option:selected").val();
        //执行重载
        table.reload('system_alarm', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            ,where: {
                alarm_name: alarm_name,
                status:status
            }
        });
    }

    //设置状态
    function setStatus(data){
        var ids = [];
        for ( var i = 0; i <data.length; i++){
            ids.push(data[i].alarm_id);
        }
        $.get("${pageContext.request.contextPath}/system/alarm/status?alarm_ids="+ids,null,function(res){
            if (res.success) {
                layer.msg("设置成功。", {time: 2000});
                reloadData();
            }else{
                if(res.loseSession=='loseSession'){
                    loseSession(res.msg,res.url)
                }else{
                    layer.msg(res.msg, {time: 2000});
                }
            }
        },'json');
    }

</script>



<%@include file="../admin/bottom.jsp"%>