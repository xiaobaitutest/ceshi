/**
 * Created by brandon on 2017/3/20.
 */
function dialogWin(options,fn) {
    "use strict";
    var def = {
        title: '对话框',
        url: '',
        data:null,
        width: 'auto',
        height: 'auto',
        divId: '_dialogWin_',//模态框id
        fullscreen:"",//用户模态框显示效果 modal-sm 小 modal-lg 大
        btns:{},//提交按钮
        closeBtn:true,
        submitBtn:true,
        closeCallback: null,
        backdrop:false,
    };
    var winOptions = {moveable: true, backdrop: false, position: 'center', rememberPos: false};
    if ($.isPlainObject(options)) {
        $.extend(def, options);
    }
    var winDivObj = $('#' + def.divId);
    var _dialogWin_ = $(
        '<div id="' + def.divId + '"  class="modal fade" >'+
        '<div class="modal-dialog ' + (def.fullscreen ? def.fullscreen: '') + '" style="width:'+def.width+'px;height:'+def.height+'px;">'+
        '<div class="modal-content">'+
        '<div class="modal-header">'+
        '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'+
        '<h4 class="modal-title">'+def.title+'</h4></div>'+
        '<div class="modal-body" style="max-height: 768px;overflow: auto;"></div>'+
        '<div class="modal-footer" style="margin-top: 0px;">'+
        (def.submitBtn===true?'<button class="btn '+def.btns.style+'" type="button" onclick="'+def.btns.callback+'">'+def.btns.name+'</button>':'')+
        (def.closeBtn===true?'<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>':'')+
        '</div>'+
        '</div>'+
        '</div>'+
        '</div>'
    );

    winOptions.backdrop = def.backdrop;
    if (winDivObj.length < 1) {
        $('body').append(_dialogWin_);
        winDivObj = $('#' + def.divId);
        $.post(def.url,def.data,function (res) {
            winDivObj.find(".modal-body").append(res);
            if(typeof fn=='function') fn(winDivObj);
        });
        winDivObj.modal(winOptions);
    }else
    {
        $('body').append(_dialogWin_);
        $.post(def.url,def.data,function (res) {
            winDivObj.find(".modal-body").html("").append(res);
            if(typeof fn=='function') fn(winDivObj);
        });
        winDivObj.modal(winOptions);
    }
    winDivObj.find(".modal-title").html(def.title);
}


function chatWin(options,fn) {
    "use strict";
    var def = {
        title: '对话框',
        url: '',
        data:null,
        width: 'auto',
        height: 'auto',
        divId: '_dialogWin_',//模态框id
        fullscreen:"",//用户模态框显示效果 modal-sm 小 modal-lg 大
        btns:{},//提交按钮
        closeBtn:true,
        submitBtn:true,
        closeCallback: null
    };
    var winOptions = {moveable: true, backdrop: false, position: 'center', rememberPos: false};
    if ($.isPlainObject(options)) {
        $.extend(def, options);
    }
    var winDivObj = $('#' + def.divId);
    var _dialogWin_ = $(
        '<div id="' + def.divId + '"  class="modal fade" >'+
        '<div class="modal-dialog ' + (def.fullscreen ? def.fullscreen: '') + '" style="width:'+def.width+'px;height:'+def.height+'px;">'+
        '<div class="modal-content">'+
        '<div class="modal-header">'+
        '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'+
        '<h4 class="modal-title">'+def.title+'</h4></div>'+
        '<div class="modal-body" style="max-height: 700px;overflow: auto;"  id="message_box1"></div>'+
        '<div class="modal-footer" style="margin-top: 0px;">'+
        // (def.submitBtn===true?'<button class="btn '+def.btns.style+'" type="button" onclick="'+def.btns.callback+'">'+def.btns.name+'</button>':'')+
        (def.submitBtn===true?'<div class="form-group"><input type="text" id="messageBox"  style="width: 100%"  class="form-control"></div>':'')+
        (def.appraiseBtn===true?'<button class="btn btn-success" style="position:relative; right:515px;"   onclick="'+def.appraiseBtns.callback+'" ><i class="fa fa-thumbs-up "></i> '+ def.appraiseBtns.name+'</button>':'')+
        (def.uploadPicBtn===true?'<div class="btn-group " style="position:relative; right:500px;"><button data-toggle="dropdown" type="button" class="btn btn-info dropdown-toggle">'+def.uploadPicBtns.name+' <span class="caret"></span></button><ul role="menu" class="dropdown-menu"><li><input type="file" name="uploadFile" id="upload_file" ></li></ul></div>':'')+
        (def.submitBtn===true?'<button class="btn btn-primary"  onclick="'+def.btns.callback+'" >'+def.btns.name+'</button>':'')+
        (def.closeBtn===true?'<button type="button" class="btn btn-default" data-dismiss="modal" onclick="user.flesh()">关闭</button>':'')+
        '</div>'+
        '</div>'+
        '</div>'+
        '</div>'
    );

    if (winDivObj.length < 1) {
        $('body').append(_dialogWin_);
        winDivObj = $('#' + def.divId);
        $.post(def.url,def.data,function (res) {
            winDivObj.find(".modal-body").append(res);
            if(typeof fn=='function') fn(winDivObj);
        });
        winDivObj.modal(winOptions);
    }else
    {
        $('body').append(_dialogWin_);
        $.post(def.url,def.data,function (res) {
            winDivObj.find(".modal-body").html("").append(res);
            if(typeof fn=='function') fn(winDivObj);
        });
        winDivObj.modal(winOptions);
    }
    winDivObj.find(".modal-title").html(def.title);

}
