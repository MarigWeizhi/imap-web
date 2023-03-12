<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>
<%--面包屑--%>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a><cite>系统管理</cite></a>
                <a><cite>用户管理</cite></a>
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
                                <label class="layui-form-lab" style="width: auto">登录账号</label>
                                <input type="text" name="login_name" id="login_name" style="width: 180px;height: 32px;display: inline" placeholder="请输入登录账号" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-lab" style="width: auto">姓名</label>
                                <input type="text" name="name" id="name" style="width: 180px;height: 32px;display: inline" placeholder="请输入姓名" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-lab" style="width: auto">邮箱</label>
                                <input type="text" name="email" id="email" style="width: 180px;height: 32px;display: inline" placeholder="请输入邮箱" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-sm"  lay-submit="" onclick="reloadData()"><i class="layui-icon">&#xe615;</i></button>
                            </div>
                        </form>
                    </div>
                </blockquote>
                <%-- 表--%>
                <div class="layui-card-body ">
                    <table class="layui-hide" id="system_user" lay-filter="system_user"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
<%--        <shiro:hasPermission name="user:add">--%>
            <button type="button" class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon"></i>新增</button>
<%--        </shiro:hasPermission>--%>
<%--        <shiro:hasPermission name="user:del">--%>
<%--            <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del"><i class="layui-icon"></i>删除</button>--%>
<%--        </shiro:hasPermission>--%>
<%--        <shiro:hasPermission name="user:resetPwd">--%>
<%--            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" lay-event="resetPwd"><i class="layui-icon">&#xe673;</i>密码重置</button>--%>
<%--        </shiro:hasPermission>--%>
<%--        <shiro:hasPermission name="user:assignAuth">--%>
<%--            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" lay-event="assignAuth"><i class="layui-icon">&#xe716;</i>权限分配</button>--%>
<%--        </shiro:hasPermission>--%>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>

<%--<script type="text/html" id="switchTpl">--%>
<%--    <!-- 这里的checked的状态只是演示 -->--%>
<%--    <input type = "checkbox" name = "sex" value = "{{d.id}}" lay-skin = "switch"lay-text = "男|女" lay-filter = "sexDemo" {{ d.sex == '1' ? 'checked': ''}} >--%>
<%--</script>--%>

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.core.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/ztree/js/jquery.ztree.all.js"></script>--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" />--%>
<%--<%@include file="../organize/organize_ztree.jsp" %>--%>
<%--<%@include file="../organize/organize_laytree.jsp" %>--%>
<script>
    var table,form;
    layui.use(['table','form'], function(){
        table = layui.table;
        form = layui.form;

        table.render({
            elem: '#system_user'
            ,url:'${pageContext.request.contextPath}/system/user/findListPage'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'laytable_tips'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left', width:50}
                ,{field:'login_name', fixed: 'left',title:'登录名', width:120, templet: function(res){
                        return filterXSS(res.login_name);
                    }}
                ,{field:'name', title:'姓名', width:120, templet: function(res){
                        return filterXSS(res.name);
                    }}
               ,{field:'sex', title:'性别', width:80, sort: true, templet: function(res){
                   if(res.sex=='1'){
                       return '男';
                   }else if(res.sex=='0'){
                       return '女';
                   }else{
                       return '未知';
                   }
               }}
                ,{field:'phone', title:'手机号', width:120, edit: 'text'}
               ,{field:'email', title:'邮箱', width:200, edit: 'text', templet: function(res){
                   return '<em>'+ res.email +'</em>'
               }}
                ,{field:'create_time', title:'创建时间'}
                ,{fixed: 'right', align:'center',title:'操作', width:200, toolbar: '#barDemo'}
            ]]
            ,id:'system_user'
            ,page: true

        });

        //头工具栏事件
        table.on('toolbar(system_user)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;
            switch(obj.event){
                case 'laytable_tips': //小提示
                    layer.msg("小提示：用户信息模块", {time: 2000});
                    break;
                case 'add': //增加
                    add();
                    break;
                case 'edit': //编辑
                    if(data.length!=1){
                        layer.msg('请选择一条数据进行操作。');
                    }else{
                        edit(data[0].user_id)
                    }
                    break;
                case 'del': //删除
                    if(data.length>0){
                        var delBol = true;
                        // for ( var i = 0; i <data.length; i++){
                        //     if($("#del_"+data[i].user_id).text()==undefined||$("#del_"+data[i].user_id).text()==''||$("#del_"+data[i].user_id).text()==null){
                        //         delBol = false;
                        //     }
                        // }
                        if(!delBol){
                            layer.msg("批量删除中存在没有删除权限的数据，请重新选择。", {time: 2000});
                            return;
                        }
                        layer.confirm('删除数据会同步删除【用户权限信息】，真的要删除数据么?', function(index){
                            var ids = [];
                            var names = [];
                            for ( var i = 0; i <data.length; i++){
                                ids.push(data[i].user_id);
                                names.push(data[i].name);
                            }
                            $.get("${pageContext.request.contextPath}/system/user/del?user_ids="+ids+"&names="+names,null,function(res){
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
                case 'resetPwd': //密码重置
                    if(data.length>0){
                        var ids = [];
                        var names = [];
                        for ( var i = 0; i <data.length; i++){
                            ids.push(data[i].user_id);
                            names.push(data[i].name);
                        }
                        resetPwd(ids);
                    }else{
                        layer.msg('请选择要重置密码的数据。');
                    }
                    break;
                case 'assignAuth': //设置权限
                    if(data.length!=1){
                        layer.msg('请选择一条数据进行操作。');
                    }else{
                        assignAuth(data[0].user_id)
                    }
                    break;
                case 'exportExcel': //导出Excel
                    exportExcel();
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(system_user)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'info'){
                info(data.user_id);
            }else if(obj.event === 'del'){
                layer.confirm('删除数据会同步删除【用户角色信息】，真的要删除数据么?', function(index){
                    $.get("${pageContext.request.contextPath}/system/user/del?user_ids="+data.user_id,null,function(res){
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
                edit(data.user_id)
            } else if(obj.event === 'resetPwd'){
                resetPwd(data.user_id)
            } else if(obj.event === 'assignAuth'){
                assignAuth(data.user_id)
            }
        });

        //监听单元格编辑
        table.on('edit(system_user)', function(obj){
            var value = obj.value //得到修改后的值
                    ,data = obj.data //得到所在行所有键值
                    ,field = obj.field; //得到字段
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/system/user/update?"+field+"="+value ,//url
                data: {
                    user_id:data.user_id
                },
                success: function (res) {
                    if (res.success) {
                        layer.msg("数据更新成功。", {time: 2000},function(){
                            // location.reload();
                        })
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

        //监听选择城市
        form.on('select(selectSex)', function(obj){
            console.log(obj);
            form.render();
            return false;
        });

    });

    function reloadData(){
        var login_name = $('#login_name').val();
        var name = $('#name').val();
        var email = $("#email").val();
        console.log(name);
        //执行重载
        table.reload('system_user', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            ,where: {
                filter_login_name: login_name,
                filter_name: name,
                filter_email:email
            }
        });
    }

    //新增
    function add(){
        // var organize_id = $("#tree_id").val();
        // var organize_name = $("#tree_name").val();
        // if(organize_id==''||organize_id==null){
        //     layer.msg("请在左侧选择组织。");
        // }else{
            parent.layer.open({
                id:'user_add',
                //skin: 'layui-layer-molv',
                title: '添加',
                maxmin: true,
                type: 2,
                content: '${pageContext.request.contextPath}/system/user/toAdd',
                area: ['1000px', '500px'],
                end: function () {
                    var val = getOpenCloseParam();
                    if(val=="reload"){
                        reloadData();
                    }
                }
            });
        // }
    }

    //编辑
    function edit(id){
        parent.layer.open({
            id:'user_edit',
            //skin: 'layui-layer-molv',
            title: '编辑',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/toUpdate?user_id='+id,
            area: ['1000px', '500px'],
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
            content: '${pageContext.request.contextPath}/system/user/findInfo?user_id='+id,
            area: ['1000px', '500px']
        });
    }


    //密码重置
    function resetPwd(ids){
        parent.layer.open({
            id:'user_password',
            //skin: 'layui-layer-molv',
            title: '重置密码',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/toResetPwd?user_id='+ids,
            area: ['600px', '240px'],
            end: function () {
            }
        });
    }

    //设置权限
    function assignAuth(id){
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '设置权限',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/user/toAssignRoleAuth?user_id='+id,
            area: ['800px', '500px']
        });
    }

    //导出Excel
    function exportExcel(){
        var login_name = $('#login_name').val();
        var name = $('#name').val();
        var status = $("#status option:selected").val();
        var email = $("#email").val();
        window.location.href="${pageContext.request.contextPath}/system/user/exportData?login_name="+login_name
                +"&name="+name
                +"&status="+status
                +"&email="+email;
    }


    function updateStatus(id,login_name,status){
        $.get("${pageContext.request.contextPath}/system/user/updateStatus?user_id="+id+"&login_name="+login_name+"&status="+status,null,function(res){
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