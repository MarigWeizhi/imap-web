<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>
<style>
    hr {
        margin: 0 0 10px 0;
    }
</style>
<form class="layui-form" action="" id="form">
    <div style="height: 32px;padding-left:10%;line-height: 32px;">
        <span style="padding-left: 5px;line-height: 32px;color: red">标注：点击保存完成注册</span>
    </div>
    <hr class="layui-bg-green">
    <table width="95%" style="margin: 0 auto">
        <tr>
            <td width="15%" align="right"><label class="layui-form-label">登录账号：<span style="color: red">*</span></label></td>
            <td><input type="text" name="login_name" id="login_name"  lay-verify="required|field_len50|minLength" autocomplete="off" placeholder="登录账号" class="layui-input"></td>
            <td width="15%" align="right"><label class="layui-form-label">姓名：<span style="color: red">*</span></label></td>
            <td><input type="text" name="name" id="name"  lay-verify="required|field_len50" autocomplete="off" placeholder="姓名" class="layui-input"></td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">登录密码：<span style="color: red">*</span></label></td>
            <td><input type="password" name="login_password" id="password"  lay-verify="required|pass" autocomplete="off" placeholder="登录密码" class="layui-input"></td>
            <td align="right"><label class="layui-form-label">确认密码：<span style="color: red">*</span></label></td>
            <td><input type="password" name="confirm_password" id="confirm_password"  lay-verify="required|confirmPass|confirmPwd" autocomplete="off" placeholder="确认密码" class="layui-input"></td>
        </tr>
        <tr>
            <td width="15%" align="right"><label class="layui-form-label">角色：<span style="color: red">*</span></label></td>
            <td><input type="text" name="role" id="role"  lay-verify="required|field_len50" autocomplete="off" placeholder="角色" class="layui-input"></td>
            <td align="right"><label class="layui-form-label">邮箱：</label></td>
            <td><input type="text" name="email" id="email"  lay-verify="email" autocomplete="off" placeholder="邮箱" class="layui-input"></td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">性别：</label></td>
            <td>
                <select name="sex" id="sex">
                    <option value="1">男</option>
                    <option value="0">女</option>
                </select>
            </td>
            <td align="right"><label class="layui-form-label">手机号：</label></td>
            <td><input type="text" name="phone" id="phone"  lay-verify="phone" autocomplete="off" placeholder="手机号" class="layui-input"></td>
        </tr>
        <tr>
            <td style="text-align: center; padding-top: 10px;" colspan="4">
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-sm" id="submit_button" lay-submit lay-filter="submit_form">保存</button>
                    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
                </div>
            </td>
        </tr>
    </table>
</form>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/xadmin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/qfverify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/qfAjaxReq.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/uploadFile.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    var form,layer,layedit,laydate,upload;
    var isSubmit=false;
    layui.use(['form', 'layedit', 'laydate','upload'], function(){
        form = layui.form;
        layer = layui.layer;
        layedit = layui.layedit;
        laydate = layui.laydate;
        upload = layui.upload;

        $('#cancel').on('click',function (){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })

        //自定义验证规则
        uploadOneImage('image','userHead');
        form.verify(form_verify);

        //初始化出生日期
        initDateType("birth_date",false);

        //监听提交
        form.on('submit(submit_form)', function(data){
            if(isSubmit)return true;
            isSubmit = true;
            layer.msg('正在提交数据。');
            $("#submit_button").attr('disabled',true);
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/system/user/save" ,//url
                data: $('#form').serialize(),
                success: function (res) {
                    isSubmit = false;
                    if (res.success) {
                        layer.msg("数据保存成功。", {time: 2000},function(){
                            setOpenCloseParam("reload");
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        });
                    }else{
                        $("#submit_button").attr('disabled',false);
                        if(res.loseSession=='loseSession'){
                            loseSession(res.msg,res.url)
                        }else{
                            layer.msg(res.msg, {time: 2000});
                        }
                    }
                },
                error : function() {
                    isSubmit = false;
                    $("#submit_button").attr('disabled',false);
                    layer.msg("异常！");
                }
            });
            return false;
        });

    });

    var index = 1;
    function addLine(){
        index ++;
        var tt = '<tr id="tr_'+index+'">';
        tt += '<td><input type="hidden" name="type" lay-verify="field_len50" value="1" autocomplete="off" class="layui-input">兼职组织</td>';
        tt += '<td>' +
                '<div style="float: left">' +
                '<input type="hidden" name="organize_id" id="organize_id_'+index+'" title="" lay-verify="field_len50" value="" autocomplete="off" class="layui-input">' +
                '<input type="text" name="organize_name" id="organize_name_'+index+'" lay-verify="required|field_len50" value="" autocomplete="off" placeholder="请选择组织" class="layui-input">' +
                '</div>' +
                '<div style="float: left">' +
                '<button style="margin-top: 4px;margin-left: 10px;" type="button" onclick="selectOneOrganize(\''+index+'\')" class="layui-btn layui-btn-xs layui-btn-normal">选择</button>' +
                '</div>';
        tt += '<td><input type="text" name="position" lay-verify="field_len50" value="" autocomplete="off" placeholder="请输入职务" class="layui-input"></td>';
        tt += '<td><input type="text" name="child_order_by" lay-verify="title" autocomplete="off" placeholder="请输入排序号" value="'+index+'" class="layui-input"></td>';
        tt += '<td style="width: 78px;"><div class="layui-btn-group"><button type="button" onclick="addLine();" class="layui-btn layui-btn-xs"><i class="layui-icon"></i></button><button type="button" onclick="delLine(\''+index+'\');" class="layui-btn layui-btn-xs layui-btn-danger"><i class="layui-icon"></i></button></div></td>';
        tt += '</tr>';
        $("#table tr:last").after(tt);
    }

    function delLine(index){
        $("#tr_"+index).remove();
    }

    //单选组织
    function selectOneOrganize(index){
        var ids = $("#organize_id_"+index).val();
        var names = $("#organize_name_"+index).val();
        sessionStorage.setItem('ids', ids);
        sessionStorage.setItem('names', names);
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: '选择组织',
            maxmin: true,
            type: 2,
            content: '${pageContext.request.contextPath}/system/organize/selectOneOrganize',
            area: ['800px', '520px'],
            end: function () {
                var val = getOpenCloseParam();
                if(val=="reload"){
                    $("#organize_id_"+index).val(sessionStorage.getItem("ids"));
                    $("#organize_name_"+index).val(sessionStorage.getItem("names"));
                    $("#organize_id_"+index).attr("title",sessionStorage.getItem("names"));
                    sessionStorage.removeItem("ids");
                    sessionStorage.removeItem("names");
                }
            }
        });
    }


</script>

<%@include file="../admin/bottom.jsp"%>