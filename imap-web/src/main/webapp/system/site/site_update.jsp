<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<form class="layui-form" action="" id="form">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">站点名称：<span style="color: red">*</span></label>
                <div class="layui-input-inline">
                    <input type="text" name="site_name" id="site_name" value="${p.siteName}" lay-verify="required|field_len50" autocomplete="off" placeholder="站点名称" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">负责人：<span style="color: red">*</span></label>
                <div class="layui-input-inline">
                    <input type="text" name="create_user" id="create_user" value="${p.createUser}" lay-verify="required|field_len50" autocomplete="off" placeholder="站点负责人id" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">站点经度：</label>
                <div class="layui-input-inline">
                    <input type="text" name="lon" id="lon" value="${p.lon}" lay-verify="longitude" autocomplete="off" placeholder="站点经度" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">站点维度：</label>
                <div class="layui-input-inline">
                    <input type="text" name="lat" id="lat"  value="${p.lat}" lay-verify="latitude" autocomplete="off" placeholder="站点维度" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">站点监控url：</label>
                <div class="layui-input-inline">
                    <input type="text" name="url" id="url" value="${p.url}"lay-verify="field_len120" autocomplete="off" placeholder="站点监控url" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">上报周期(秒)：</label>
                <div class="layui-input-inline">
                    <input type="text" name="interval" id="interval" value="${p.interval}" lay-verify="field_len10|intNumberNo0" autocomplete="off" placeholder="上报周期(秒)" class="layui-input">
                </div>
            </div>
        </div>

        <%--        温度设置--%>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label" style="width: 200px;">温度监控阈值（单位℃）：</label>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="checkbox" <c:if test="${p.tmpOpen=='1'}"> checked="checked" </c:if> name="tmp_open" lay-skin="switch" lay-filter="switchTest" lay-text="开启监控|暂不监控">
                    </div>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="text" name="tmp_min" id="tmp_min" value="${p.tmpMin}" lay-verify="field_len50|float" autocomplete="off" placeholder="最低温度" class="layui-input">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="text" name="tmp_max" id="tmp_max" value="${p.tmpMax}" lay-verify="field_len50|float" autocomplete="off" placeholder="最高温度" class="layui-input">
                    </div>
                </div>
            </div>
<%--        湿度设置--%>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label" style="width: 200px;">湿度监控阈值（范围0-1）：</label>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="checkbox" <c:if test="${p.hmtOpen=='1'}"> checked="checked" </c:if> name="hmt_open" lay-skin="switch" lay-filter="switchTest" lay-text="开启监控|暂不监控">
                    </div>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="text" name="hmt_min" id="hmt_min" value="${p.hmtMin}" lay-verify="field_len50|float" autocomplete="off" placeholder="最低湿度" class="layui-input">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="text" name="hmt_max" id="hmt_max" value="${p.hmtMax}" lay-verify="field_len50|float" autocomplete="off" placeholder="最高湿度" class="layui-input">
                    </div>
                </div>
            </div>
<%--        亮度设置--%>
            <div class="layui-form-item">
                <div class="layui-inline" >
                    <label class="layui-form-label" style="width: 200px;">亮度监控阈值（单位lx）：</label>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="checkbox" <c:if test="${p.lxOpen=='1'}"> checked="checked" </c:if> name="lx_open" lay-skin="switch" lay-filter="switchTest" lay-text="开启监控|暂不监控">
                    </div>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="text" name="lx_min" id="lx_min" value="${p.lxMin}"  lay-verify="field_len50|float" autocomplete="off" placeholder="最低亮度" class="layui-input">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="text" name="lx_max" id="lx_max" value="${p.lxMax}"  lay-verify="field_len50|float" autocomplete="off" placeholder="最高亮度" class="layui-input">
                    </div>
                </div>
            </div>

    <%--    提交--%>
    <div class="layui-form-item" >
        <div class="layui-inline" style="width: 100%; text-align: center; padding-top: 10px;" >
            <input type="hidden" name="site_id" id="site_id" value="${p.siteId}" />
            <button type="button" class="layui-btn layui-btn-sm" id="submit_button" lay-submit="" lay-filter="submit_form">保存</button>
            <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
        </div>
    </div>
<%--    <div class="layui-form-item">--%>
<%--        <button type="button" class="layui-btn layui-btn-sm" id="submit_button" lay-submit="" lay-filter="submit_form">保存</button>--%>
<%--            <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>--%>
<%--    </div>--%>
</form>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/xadmin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/qfverify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/qfAjaxReq.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    var form,layer,laydate;
    var isSubmit=false;
    layui.use(['form', 'laydate'], function(){
        form = layui.form;
        layer = layui.layer;
        laydate = layui.laydate;

        $('#cancel').on('click',function (){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })

        //自定义验证规则
        form.verify(form_verify);

        //监听提交
        form.on('submit(submit_form)', function(data){
            if(isSubmit)return ;
            isSubmit=true;
            console.log("提交");
            layer.msg('正在提交数据。');
            $("#submit_button").attr('disabled',true);
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/system/site/update" ,//url
                data: $('#form').serialize(),
                success: function (res) {
                    isSubmit = false;
                    if (res.success) {
                        layer.msg("数据更新成功。", {time: 2000},function(){
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