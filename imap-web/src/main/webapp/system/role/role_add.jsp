<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<form class="layui-form" action="" id="form">
    <%--    角色名称、上报周期 --%>
    <div class="layui-form-item">
        <div class="layui-inline" style="align-content: center">
            <label class="layui-form-label" style="width: 200px;">角色名称：<span style="color: red">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="role_name" id="role_name" lay-verify="required|field_len50" autocomplete="off" placeholder="角色名称" class="layui-input">
            </div>
        </div>
    </div>

    <%--        数据权限--%>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 200px;">在线监控：</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="checkbox" name="online" lay-skin="switch" lay-filter="switchTest" lay-text="允许|禁止">
            </div>
            <label class="layui-form-label" style="width: 200px;">历史数据：</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="checkbox" name="history" lay-skin="switch" lay-filter="switchTest" lay-text="允许|禁止">
            </div>
        </div>
    </div>
    <%--        用户设置--%>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 200px;">用户管理：</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="checkbox" name="user" lay-skin="switch" lay-filter="switchTest" lay-text="允许|禁止">
            </div>
            <label class="layui-form-label" style="width: 200px;">角色管理：</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="checkbox" name="role" lay-skin="switch" lay-filter="switchTest" lay-text="允许|禁止">
            </div>
        </div>
    </div>
    <%--        站点设置--%>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 200px;">站点管理：</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="checkbox" name="site" lay-skin="switch" lay-filter="switchTest" lay-text="允许|禁止">
            </div>
            <label class="layui-form-label" style="width: 200px;">告警管理：</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="checkbox" name="alarm" lay-skin="switch" lay-filter="switchTest" lay-text="允许|禁止">
            </div>
        </div>
    </div>
    <%--    提交--%>
    <div class="layui-form-item" >
        <div class="layui-inline" style="width: 100%; text-align: center; padding-top: 10px;" >
            <button type="button" class="layui-btn layui-btn-sm" id="submit_button" lay-submit="" lay-filter="submit_form">保存</button>
            <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
        </div>
    </div>
</form>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/xadmin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/qfverify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/qfAjaxReq.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    var form,layer,layedit,laydate;
    var isSubmit=false;
    layui.use(['form', 'layedit', 'laydate'], function(){
        form = layui.form;
        layer = layui.layer;
        layedit = layui.layedit;
        laydate = layui.laydate;

        $('#cancel').on('click',function (){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })

        //自定义验证规则
        form.verify(form_verify);

        //监听提交
        form.on('submit(submit_form)', function(data){
            if(isSubmit)return true;
            isSubmit = true;

            layer.msg('正在提交数据。');
            $("#submit_button").attr('disabled',true);
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/system/role/save" ,//url
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
</script>

<%@include file="../admin/bottom.jsp"%>