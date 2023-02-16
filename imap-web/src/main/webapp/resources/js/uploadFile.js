var prefix = $("#ctxValue").val();
var imgValue = $("#imgValue").val();

function uploadMoreFile(index,type){
    //console.log(index);
    //console.log($("#fileIds_"+index).val());
    var fileIds = [];
    if($("#fileIds_"+index).val()==''||$("#fileIds_"+index).val()==null){
        fileIds=[];
    }else{
        fileIds=$("#fileIds_"+index).val().split(",");
    }
    //多图片上传
    upload.render({
        elem: '#upload_file_'+index
        ,url: prefix+'/common/upload/uploadFile?source='+type
        ,multiple: true
        ,accept: 'file' //普通文件
        ,done: function(res){
            var tt = '<tr id="tr_'+index+'">';
            tt += '<td>'+res.data.name+'</td>';
            tt += '<td>' +
                '<div class="layui-btn-group">' +
                '<button type="button" onclick="downloadFile(\''+ res.data.id +'\',\''+ res.data.file_path +'\',\''+ res.data.name +'\');" class="layui-btn layui-btn-xs">下载</button>' +
                '<button type="button" onclick="delMoreFile(\''+ index +'\',\''+ res.data.id +'\',\''+ res.data.file_path +'\');" class="layui-btn layui-btn-xs layui-btn-danger">删除</button>' +
                '</div>' +
                '</td>';
            tt += '</tr>';
            $('#tbody_file_'+index).append(tt);
            fileIds.push(res.data.id);
            $("#fileIds_"+index).val(fileIds);
        }
    });
}

function delMoreFile(index,id,file_path){
    layer.confirm('删除文件后，只能重新上传，真的要删除文件么？', function(i){
        var fileIds=[];
        if($("#fileIds_"+index).val()==''||$("#fileIds_"+index).val()==null){
            fileIds=[];
        }else{
            fileIds=$("#fileIds_"+index).val().split(",");
        }
        $.ajax({
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: prefix+"/common/upload/delFile?id="+id+"&file_path="+file_path,//url
            data: "",
            success: function (res) {
                if (res.success) {
                    layer.msg(res.msg, {time: 2000});
                    //图片数量减1
                    $("#tr_"+index).remove();
                    fileIds.remove(id);
                    $("#fileIds_"+index).val(fileIds);
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url);
                    }else{
                        layer.msg(res.msg, {time: 2000});
                    }
                }
            },
            error : function() {
                layer.msg("异常！");
            }
        });
    });
}

//预览
function preview(name,file_type,file_path){
    var img_type = "jpg|png|gif|bmp|jpeg";
    var office_type = "doc|docx|ppt|pptx|xls|xlsx|pdf";
    if(img_type.indexOf(file_type)!=-1){//图片文件
        var src = imgValue+file_path;
        console.log("图片地址>>>"+src)
        var img = new Image();
        img.src = src;
        var height = img.height * 1; //获取图片高度
        var width = img.width * 1; //获取图片宽度
        if(height>392){
            height=392;
        }
        if(width>619){
            height=619;
        }
        if(width==0){
//                height=619;
            width=392;
        }
        if(height==0){
            height=392;
        }
        var imgHtml = "<img width='"+width+"px' height='"+height+"px' src='"+imgValue + file_path + "' />";
        //弹出层
        parent.layer.open({
            type: 1,
            shade: 0.8,
            offset: 'auto',
            area: [width + 'px', height + 'px'],
            shadeClose: true,//点击外围关闭弹窗
            scrollbar: false,//不现实滚动条
            title: "", //不显示标题
            content: imgHtml, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            cancel: function () {
                //layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', { time: 5000, icon: 6 });
            }
        });
    }else if(office_type.indexOf(file_type)!=-1){//office文件
        console.log("附件地址>>>"+file_path)
        parent.layer.open({
            //skin: 'layui-layer-molv',
            title: name,
            maxmin: true,
            type: 2,
            content: prefix+"/pages/pdfjs/web/viewer.html?file="+encodeURIComponent(prefix+"/common/pdfjs/preview?file_path="+file_path),
            area: ['1000px', '540px'],
            end: function () {
            }
        });
    }else{
        layer.msg("文件格式【"+file_type+"】不支持在线预览。", {time: 2000});
    }
}



function uploadFile(index,type){
    //多图片上传
    upload.render({
        elem: '#upload_file_'+index
        ,url: prefix+'/mall/upload/uploadFile?source='+type
        ,multiple: true
        ,accept: 'file' //普通文件
        ,done: function(res){
            var tt = '<tr id="tr_'+res.data.id+'">';
            tt += '<td>'+res.data.name+'</td>';
            tt += '<td>' +
                '<div class="layui-btn-group">' +
                '<button type="button" onclick="downloadFile(\''+ res.data.id +'\',\''+ res.data.file_path +'\',\''+ res.data.name +'\');" class="layui-btn layui-btn-xs">下载</button>' +
                '<button type="button" onclick="delMoreFile(\''+ index +'\',\''+ res.data.id +'\',\''+ res.data.file_path +'\');" class="layui-btn layui-btn-xs layui-btn-danger">删除</button>' +
                '</div>' +
                '</td>';
            tt += '</tr>';
            $('#tbody_file_'+index).append(tt);
            fileIds.push(res.data.id);
        }
    });
}

function delFile(index,id,file_path){
    layer.confirm('删除文件后，只能重新上传，真的要删除文件么？', function(i){
        $.ajax({
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: prefix+"/mall/upload/delFile?id="+id+"&file_path="+file_path,//url
            data: "",
            success: function (res) {
                if (res.success) {
                    layer.msg(res.msg, {time: 2000});
                    //图片数量减1
                    $("#tr_"+id).remove();
                    fileIds.remove(id);
                }else{
                    if(res.loseSession=='loseSession'){
                        loseSession(res.msg,res.url);
                    }else{
                        layer.msg(res.msg, {time: 2000});
                    }
                }
            },
            error : function() {
                layer.msg("异常！");
            }
        });
    });
}


function downloadFile(id,file_path,name){
    window.location.href=prefix+"/common/upload/downloadFile?name="+name+"&file_path="+file_path;
}


//上传单图片
function uploadOneImage(type,source){
    //单文件上传
    var upIndex = 0;
    var uploadInst = upload.render({
        elem: '#upload_'+type
        ,url: prefix+'/common/upload/uploadFile?source='+source
        ,multiple: true
        ,accept: 'images' //普通文件
        ,acceptMime: 'image/*'
        ,before: function(obj){
            //预读本地文件示例，不支持ie8
            obj.preview(function(index, file, result){
                $('#file_'+type).attr('src', result); //图片链接（base64）
            });
            upIndex = layer.msg('上传中', {icon: 16,shade: 0.01});
            // element.progress('demo', '0%'); //进度条复位
        }
        ,done: function(res){
            layer.close(upIndex);
            if($("#fileId_"+type).val()!=''&&$("#fileId_"+type).val()!=null) {
                var fileId = $("#fileId_"+type).val();
                var filePath = $("#filePath_"+type).val();
                delOneImage(fileId, filePath);
            }
            $("#fileId_"+type).val(res.data.id);
            $("#filePath_"+type).val(res.data.file_path);
            $('#tip_'+type).html('');
        }
        ,error: function(){
            //演示失败状态，并实现重传
            var demoText = $('#tip_'+type);
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function(){
                uploadInst.upload();
            });
        }
        // //进度条
        // ,progress: function(n, elem, e){
        //     element.progress('demo', n + '%'); //可配合 layui 进度条元素使用
        //     if(n == 100){
        //         layer.msg('上传完毕', {icon: 1});
        //     }
        // }
    });
}

//单图片删除
function delOneImage(id,file_path){
    $.ajax({
        type: "GET",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: prefix+"/common/upload/delFile?id="+id+"&file_path="+file_path,//url
        data: "",
        success: function (res) {
            if (res.success) {
                // layer.msg(res.msg, {time: 2000});
                //图片数量减1
                $("#file_show").html("");
                $("#fileId").val("");
                $("#filePath").val("");
            }else{
                if(res.loseSession=='loseSession'){
                    loseSession(res.msg,res.url);
                }else{
                    layer.msg(res.msg, {time: 2000});
                }
            }
        }
    });
}


