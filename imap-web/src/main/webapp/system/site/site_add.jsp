<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>

<form class="layui-form" action="" id="form">
    <table width="95%" style="margin: 0 auto">
        <tr>
            <td width="15%" align="right"><label class="layui-form-label">站点名称：<span style="color: red">*</span></label></td>
            <td colspan="3"><input type="text" name="site_name" id="site_name" lay-verify="required|field_len50" autocomplete="off" placeholder="站点名称" class="layui-input"></td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">站点经度：</label></td>
            <td colspan="3"><input type="text" name="lat" id="lat" lay-verify="field_len10|float" autocomplete="off" placeholder="站点经度" class="layui-input"></td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">站点纬度：</label></td>
            <td colspan="3"><input type="text" name="lon" id="lon" lay-verify="field_len10|float" autocomplete="off" placeholder="站点纬度" class="layui-input"></td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">站点监控url：</label></td>
            <td colspan="3"><input type="text" name="url" id="url" lay-verify="field_len50" autocomplete="off" placeholder="站点监控url" class="layui-input"></td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">上报周期(秒)：</label></td>
            <td colspan="3"><input type="text" name="report_interval" id="report_interval" lay-verify="field_len10|intNumberNo0" autocomplete="off" placeholder="上报周期(秒)" class="layui-input"></td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">温度监控阈值（单位℃）：</label></td>
            <td colspan="3"><input type="checkbox" checked="" name="tmp" lay-skin="switch" lay-filter="switchTest" lay-text="开启监控|暂不监控"></td>
            <td colspan="3"><input type="text" name="tmp_min" id="tmp_min" lay-verify="field_len50|float" autocomplete="off" placeholder="最低温度" class="layui-input"></td>
            <td colspan="3"><input type="text" name="tmp_max" id="tmp_max" lay-verify="field_len50|float" autocomplete="off" placeholder="最高温度" class="layui-input"></td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">湿度监控阈值（范围0-1）：</label></td>
            <td colspan="3"><input type="checkbox" checked="" name="hmt" lay-skin="switch" lay-filter="switchTest" lay-text="开启监控|暂不监控"></td>
            <td colspan="3"><input type="text" name="hmt_min" id="hmt_min" lay-verify="field_len50|float" autocomplete="off" placeholder="最低湿度" class="layui-input"></td>
            <td colspan="3"><input type="text" name="hmt_max" id="hmt_max" lay-verify="field_len50|float" autocomplete="off" placeholder="最高湿度" class="layui-input"></td>
        </tr>
        <tr>
            <td align="right"><label class="layui-form-label">亮度监控阈值（单位lx）：</label></td>
            <td colspan="3"><input type="checkbox" checked="" name="lx" lay-skin="switch" lay-filter="switchTest" lay-text="开启监控|暂不监控"></td>
            <td colspan="3"><input type="text" name="lx_min" id="lx_min" lay-verify="field_len50|float" autocomplete="off" placeholder="最低亮度" class="layui-input"></td>
            <td colspan="3"><input type="text" name="lx_max" id="lx_max" lay-verify="field_len50|float" autocomplete="off" placeholder="最高亮度" class="layui-input"></td>
        </tr>

        <tr>
            <td style="text-align: center; padding-top: 10px;" colspan="4">
                <div class="layui-form-item">
                    <button type="button" class="layui-btn layui-btn-sm" id="submit_button" lay-submit="" lay-filter="submit_form">保存</button>
                    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="cancel">取消</button>
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
    var form,layer,layedit,laydate;
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


            layer.msg('正在提交数据。');
            $("#submit_button").attr('disabled',true);
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/system/site/save" ,//url
                data: $('#form').serialize(),
                success: function (res) {
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
                    $("#submit_button").attr('disabled',false);
                    layer.msg("异常！");
                }
            });
            return false;
        });

    });
</script>

<%@include file="../admin/bottom.jsp"%>