<%--
  Created by IntelliJ IDEA.
  User: Weizhi
  Date: 2022/11/16
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/top.jsp"%>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a><cite>数据监控</cite></a>
                <a><cite>历史数据</cite></a>
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
                                <label class="layui-form-lab" style="width: auto">站点编号</label>
                                <input type="text" name="siteId" id="siteId" required  lay-verify="required" style="width: 64px;height: 32px;display: inline" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-lab" style="width: auto">数据类型</label>
                                <div class="layui-input-inline">
                                    <select name="dataType" id="dataType" required  lay-verify="required" style="width: 60px;height: 32px;" class="layui-input">
                                        <option value=""></option>
                                        <option value="0">温度</option>
                                        <option value="1">湿度</option>
                                        <option value="2">亮度</option>
                                        <option value="3">告警</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-lab" style="width: auto">时间粒度</label>
                                <div class="layui-input-inline">
                                    <select name="timeType" id="timeType" required  lay-verify="required" style="width: 60px;height: 32px;" class="layui-input">
                                        <option value=""></option>
                                        <option value="1">分</option>
                                        <option value="2">时</option>
                                        <option value="3">天</option>
                                        <option value="4">周</option>
                                        <option value="5">月</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-input-inline">
                                <label class="layui-form-label">查询日期</label>
                                <div class="layui-input-inline">
                                <input class="layui-input" style="width: 280px;" placeholder="起止时间" name="time" id="time">
                                </div>
                            </div>

                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-sm"  lay-submit lay-filter="formFilter"><i class="layui-icon">&#xe615;</i></button>
<%--                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
                            </div>
                        </form>
                    </div>
                </blockquote>
            </div>
        </div>

        <%-- 图表位置--%>
        <div class="layui-col-md12">
            <div id="dataChart" style="width: 100%;height:500px;">
            </div>
        </div>
    </div>
</div>


<%--图表--%>
<script>
    var laydate,form;
    layui.use(['laydate','form'], function(){
        form = layui.form;
        laydate = layui.laydate;
        laydate.render({
            elem: '#time',
            type:'datetime',
            format: 'yyyy-MM-dd HH:mm:ss',
            range: '~',
            max: 1
        });
        //监听提交
        form.on('submit(formFilter)', function(data){
            console.log(data);
            reloadData(data);
            return false;
        });
    });

    var myChart = echarts.init(document.getElementById('dataChart'));
    let base = +new Date(2022, 9, 1);
    let oneDay = 24 * 3600 * 1000;
    let data = [[base, Math.random() * 300]];
    for (let i = 1; i < 200; i++) {
        let now = new Date((base += oneDay));
        data.push([+now, Math.round((Math.random() - 0.5) * 20 + data[i - 1][1])]);
    }
    var option = {
        tooltip: {
            trigger: 'axis',
            position: function (pt) {
                return [pt[0], '10%'];
            }
        },
        title: {
            left: 'center',
            text: '历史数据'
        },
        toolbox: {
            feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                restore: {},
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'time',
            boundaryGap: false
        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%']
        },
        dataZoom: [
            {
                type: 'inside',
                start: 0,
                end: 20
            },
            {
                start: 0,
                end: 20
            }
        ],
        series: [
            {
                name: 'Test Data',
                type: 'line',
                smooth: true,
                symbol: 'none',
                areaStyle: {},
                data: data
            }
        ]
    };
    myChart.setOption(option);
    function reloadData(formData){
        console.log(formData);
        $.ajax(
            {
                url: '${pageContext.request.contextPath}/system/history/',
                type: 'GET',
                data: formData.field,
                headers: {"token": null},
                dataType: "json",
                xhrFields: {withCredentials: false},
                success: function (data) {
                    console.log(data);
                    option.title.text = data.title
                    option.series[0].name = data.typeName;
                    option.series[0].data = data.data;
                    myChart.setOption(option);
                }
            }
        );
    }

</script>
<%@include file="../admin/bottom.jsp"%>
