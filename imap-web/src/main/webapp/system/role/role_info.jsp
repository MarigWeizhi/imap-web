<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<form class="layui-form" action="" id="form">
    <table class="layui-table" style="width:95%;margin:10px auto;">
        <tr>
            <td align="right"><label class="layui-form-label">角色名称：<span style="color: red">*</span></label></td>
            <td colspan="3">
                ${p.role_name}
            </td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">角色等级：</label></td>
            <td colspan="3">${p.role_lever}</td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">更新时间：</label></td>
            <td colspan="3">${p.update_time}</td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">创建时间：</label></td>
            <td colspan="3">${p.create_time}</td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">创建用户：</label></td>
            <td colspan="3">${p.create_user}</td>
        </tr>
        <tr>
            <td style="text-align: center; padding-top: 10px;" colspan="4">
                <div class="layui-form-item">
                    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">关闭</button>
                </div>
            </td>
        </tr>
    </table>
</form>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/xadmin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/qfverify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/qfAjaxReq.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    var form,layer;
    layui.use(['form'], function(){
        form = layui.form;
        layer = layui.layer;

        $('#cancel').on('click',function (){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })
    });
</script>

<%@include file="../admin/bottom.jsp"%>