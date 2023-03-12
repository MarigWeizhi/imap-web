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
                <a><cite>站点管理</cite></a>
            </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space1">
        <div class="layui-col-md12">
            <div class="layui-card">
                <%--搜索栏--%>
                <blockquote id="search" class="layui-elem-quote" style="position: relative;">
                    <div class="layui-card-body ">
                        <form class="layui-form layui-col-space5">
                            <div class="layui-inline">
                                <label class="layui-form-lab" style="width: auto">站点名称</label>
                                <input type="text" name="site_name" id="site_name" style="width: 180px;height: 32px;display: inline" placeholder="请输入站点名称" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-lab" style="width: auto">负责人</label>
                                <input type="text" name="create_user" id="create_user" style="width: 180px;height: 32px;display: inline" placeholder="请输入负责人id" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-sm"  lay-submit="" onclick="reloadData()"><i class="layui-icon">&#xe615;</i></button>
                            </div>
                        </form>
                    </div>
                </blockquote>
                <div class="layui-card-body ">
                    <table class="layui-hide" id="system_site" lay-filter="system_site"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<%--主功能区--%>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button type="button" class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon"></i>新增</button>
        <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del"><i class="layui-icon"></i>删除</button>
    </div>
</script>

<%--每行数据操作--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">监控配置</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<%--表单逻辑--%>
<script>
    var table,form;
    layui.use(['table','form'], function(){
        table = layui.table;
        form = layui.form;

        table.render({
            elem: '#system_site'
            ,url:'${pageContext.request.contextPath}/system/site/findListPage'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'laytable_tips'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '站点数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left', width:50}
                ,{field:'site_id', width:100, fixed: 'left',title:'站点编号'}
                ,{field:'site_name',width:160, fixed: 'left',title:'站点名称'}
                ,{field:'lat',width:160, fixed: 'left',title:'经度'}
                ,{field:'lon',width:160, fixed: 'left',title:'纬度'}
                ,{field:'create_user',width:80, fixed: 'left',title:'负责人'}
                ,{field:'update_time',width:180, fixed: 'left',title:'更新时间'}
                ,{field:'create_time',width:180, fixed: 'left',title:'创建时间'}
                ,{fixed: 'right', align:'center',title:'操作', width:150, toolbar: '#barDemo'}
            ]]
            ,id:'system_site'
            ,page: true
            ,done: function (res, curr, count) {
            }
        });

        //头工具栏事件
        table.on('toolbar(system_site)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;
            switch(obj.event){
                case 'laytable_tips': //小提示
                    layer.msg("小提示：站点信息模块", {time: 2000});
                    break;
                case 'add': //增加
                    add();
                    break;
                case 'del': //删除
                    if(data.length>0){
                        var delBol = true;
                        if(!delBol){
                            layer.msg("批量删除中存在没有删除权限的数据，请重新选择。", {time: 2000});
                            return;
                        }
                        layer.confirm('删除数据会同步删除【监控配置信息】，真的要删除数据么?', function(index){
                            var ids = [];
                            for ( var i = 0; i <data.length; i++){
                                ids.push(data[i].site_id);
                            }
                            $.get("${pageContext.request.contextPath}/system/site/del?site_ids="+ids,null,function(res){
                                console.log(res);
                                if (res.success) {
                                    layer.msg("数据删除成功。", {time: 2000});
                                    reloadData();
                                }else{
                                    if(res.loseSession=='loseSession'){
                                        loseSession(res.msg,res.url)
                                    }else{
                                        layer.msg(res.msg, {time: 2000});
                                    }
                                }
                            },'json');
                        });
                    }else{
                        layer.msg('请选择要删除的数据。');
                    }
                    break;
                case 'assignAuth': //设置权限
                    if(data.length!=1){
                        layer.msg('请选择一条数据进行操作。');
                    }else{
                        assignAuth(data[0].site_id)
                    }
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(system_site)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'info'){
                info(data.site_id);
            }else if(obj.event === 'del'){
                layer.confirm('删除数据会同步删除【监控配置信息】，真的要删除数据么?', function(index){
                    $.get("${pageContext.request.contextPath}/system/site/del?site_ids="+data.site_id,null,function(res){
                        if (res.success) {
                            layer.msg("数据删除成功。", {time: 2000});
                            reloadData();
                        }else{
                            if(res.loseSession=='loseSession'){
                                loseSession(res.msg,res.url)
                            }else{
                                layer.msg(res.msg, {time: 2000});
                            }
                        }
                    },'json');
                });
            } else if(obj.event === 'edit'){
                edit(data.site_id)
            } else if(obj.event === 'assignAuth'){
                assignAuth(data.site_id)
            }
        });

        //监听单元格编辑
        table.on('edit(system_site)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/system/site/update?"+field+"="+value ,//url
                data: {
                    id:data.site_id
                },
                success: function (res) {
                    if (res.success) {
                        location.reload();
                    }else{
                        if(res.loseSession=='loseSession'){
                            loseSession(res.msg,res.url)
                        }else{
                            layer.msg(res.msg, {time: 2000});
                        }
                    }
                }
            });
        });

    });

    function reloadData(){
        var site_name = $('#site_name').val();
        var create_user = $("#create_user").val();
        //执行重载
        table.reload('system_site', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            ,where: {
                filter_site_name: site_name,
                filter_create_user:create_user
            }
        });
    }

    //新增
    function add(){
        parent.layer.open({
            id:'site_add',
            //skin: 'layui-layer-molv',
            title: '添加',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/site/toAdd?',
            area: ['800px', '500px'],
            end: function () {
                var val = getOpenCloseParam();
                if(val=="reload"){
                    reloadData();
                }
            }
        });
    }

    //编辑
    function edit(site_id){
        parent.layer.open({
            id:'site_edit',
            //skin: 'layui-layer-molv',
            title: '编辑',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/site/toUpdate?site_id='+site_id,
            area: ['800px', '500px'],
            end: function () {
                var val = getOpenCloseParam();
                if(val=="reload"){
                    reloadData();
                }
            }
        });
    }

    //详情
    function info(id){
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '详情',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/site/findInfo?id='+id,
            area: ['800px', '500px']
        });
    }




    //设置权限
    function assignAuth(id){
        parent.layer.open({
            id:'site_auth',
            //skin: 'layui-layer-molv',
            title: '分配权限',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/site/toSetAuth?site_id='+id,
            area: ['320px', '500px'],
            end: function () {
            }
        });
    }

</script>



<%@include file="../admin/bottom.jsp"%>