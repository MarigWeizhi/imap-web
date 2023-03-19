<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a><cite>系统管理</cite></a>
                <a><cite>角色管理</cite></a>
            </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space1">
        <div class="layui-col-md12">
            <div class="layui-card">
                <blockquote id="search" class="layui-elem-quote" style="position: relative;">
                    <div class="layui-card-body ">
                        <form class="layui-form layui-col-space5">
                            <div class="layui-inline">
                                <label class="layui-form-lab" style="width: auto">角色名称</label>
                                <input type="text" name="role_name" id="role_name" style="width: 180px;height: 32px;display: inline" placeholder="请输入角色名称" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-sm"  lay-submit="" onclick="reloadData()"><i class="layui-icon">&#xe615;</i></button>
                            </div>
                        </form>
                    </div>
                </blockquote>
                <div class="layui-card-body ">
                    <table class="layui-hide" id="system_role" lay-filter="system_role"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
            <button type="button" class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon"></i>新增</button>
<%--            <button type="button" class="layui-btn layui-btn-sm" lay-event="addMore"><i class="layui-icon"></i>批量新增</button>--%>
<%--            <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" lay-event="edit"><i class="layui-icon"></i>编辑</button>--%>
<%--            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" lay-event="assignAuth"><i class="layui-icon">&#xe716;</i>权限分配</button>--%>
    </div>
</script>

<script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">权限分配</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon"></i>删除</a>
</script>

<script>
    var table,form;
    layui.use(['table','form'], function(){
        table = layui.table;
        form = layui.form;

        table.render({
            elem: '#system_role'
            ,url:'${pageContext.request.contextPath}/system/role/findListPage'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'laytable_tips'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '角色数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left', width:50}
                ,{field:'role_id', fixed: 'left', width:100,title:'角色编号'}
                ,{field:'role_name', fixed: 'left', width:180,title:'角色名称'}
                ,{field:'role_config', fixed: 'left', width:300,title:'角色权限'}
                ,{field:'create_user', fixed: 'left', width:80,title:'创建者'}
                ,{field:'update_time', fixed: 'left', width:200,title:'更新时间'}
                ,{fixed: 'right', align:'center',title:'操作', width:200, toolbar: '#barDemo'}
            ]]
            ,id:'system_role'
            ,page: true
            ,done: function (res, curr, count) {
            }
        });

        //头工具栏事件
        table.on('toolbar(system_role)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;
            switch(obj.event){
                case 'laytable_tips': //小提示
                    layer.msg("小提示：角色信息模块", {time: 2000});
                    break;
                case 'add': //增加
                    add();
                    break;
                case 'addMore': //批量增加
                    addMore();
                    break;
                case 'edit': //编辑
                    if(data.length!=1){
                        layer.msg('请选择一条数据进行操作。' );
                    }else{
                        edit(data[0].role_id)
                    }
                    break;
                case 'del': //删除
                    if(data.length>0){
                        layer.confirm('删除数据会同步删除【角色信息】，真的要删除数据么?', function(index){
                            var ids = [];
                            var names = [];
                            for ( var i = 0; i <data.length; i++){
                                ids.push(data[i].role_id);
                                names.push(data[i].role_name);
                            }
                            $.get("${pageContext.request.contextPath}/system/role/del?role_ids="+ids+"&names="+names,null,function(res){
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
                        assignAuth(data[0].role_id)
                    }
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(system_role)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'info'){
                info(data.role_id);
            }else if(obj.event === 'del'){
                layer.confirm('删除数据会同步删除【角色菜单信息】，真的要删除数据么?', function(index){
                    $.get("${pageContext.request.contextPath}/system/role/del?ids="+data.role_id,null,function(res){
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
                edit(data.role_id)
            } else if(obj.event === 'assignAuth'){
                assignAuth(data.role_id)
            } else if(obj.event === 'setStatus1'){
                updateStatus(data.role_id,'1');
            } else if(obj.event === 'setStatus0'){
                updateStatus(data.role_id,'0');
            }
        });

    });

    function reloadData(){
        var role_name = $('#role_name').val();
        //执行重载
        table.reload('system_role', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            ,where: {
                filter_role_name: role_name
            }
        });
    }

    //新增
    function add(){
        parent.layer.open({
            id:'role_add',
            //skin: 'layui-layer-molv',
            title: '添加',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/role/toAdd?',
            area: ['800px', '400px'],
            end: function () {
                var val = getOpenCloseParam();
                if(val=="reload"){
                    reloadData();
                }
            }
        });
    }


    //新增
    function addMore(){
        parent.layer.open({
            id:'role_add',
            //skin: 'layui-layer-molv',
            title: '批量添加',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/role/toAddMore',
            area: ['800px', '400px'],
            end: function () {
                var val = getOpenCloseParam();
                if(val=="reload"){
                    reloadData();
                }
            }
        });
    }

    //编辑
    function edit(role_id){
        parent.layer.open({
            id:'role_edit',
            //skin: 'layui-layer-molv',
            title: '编辑',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/role/toUpdate?role_id='+role_id,
            area: ['800px', '400px'],
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
            content: '${pageContext.request.contextPath}/system/role/findInfo?id='+id,
            area: ['800px', '500px']
        });
    }


    //设置权限
    function assignAuth(id){
        parent.layer.open({
            id:'role_auth',
            //skin: 'layui-layer-molv',
            title: '分配权限',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/role/toSetAuth?role_id='+id,
            area: ['320px', '500px'],
            end: function () {
            }
        });
    }



    function updateStatus(id,status){
        $.get("${pageContext.request.contextPath}/system/role/updateStatus?id="+id+"&status="+status,null,function(res){
            if (res.success) {
                layer.tips("状态修改成功。");
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