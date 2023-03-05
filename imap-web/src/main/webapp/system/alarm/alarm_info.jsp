<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<form class="layui-form" action="" id="form">
    <table class="layui-table" style="width:95%;margin:10px auto;">
        <tr>
            <td width="16%" align="right"><label class="layui-form-label">告警编号：</label></td>
            <td>${p.alarm_id}</td>
            <td width="16%" align="right"><label class="layui-form-label">站点名称：</label></td>
            <td>${p.site_name}</td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">站点负责人：</label></td>
            <td>${p.name}</td>
            <td align="right"><label class="layui-form-label">负责人邮箱：</label></td>
            <td>${p.email}</td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">告警类型：</label></td>
            <td>
                <c:if test="${p.type=='0'}"> 温度异常 </c:if>
                <c:if test="${p.type=='1'}"> 湿度异常 </c:if>
                <c:if test="${p.type=='2'}"> 亮度异常 </c:if>
                <c:if test="${p.type=='3'}"> 其他异常 </c:if>
            </td>
            <td align="right"><label class="layui-form-label">状态：</label></td>
            <td>
                <c:if test="${p.status=='0'}"> 未处理 </c:if>
                <c:if test="${p.status=='1'}"> 已处理 </c:if>
            </td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">告警信息：</label></td>
            <td>${p.info}</td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">告警时间：</label></td>
            <td>${p.time}</td>
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