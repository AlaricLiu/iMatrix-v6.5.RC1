<%@ page contentType="text/html;charset=UTF-8" import="java.util.*"%>
<%@ include file="/common/setting-taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
	<%@ include file="/common/setting-iframe-meta.jsp"%>
	<script type="text/javascript" src="${resourcesCtx}/widgets/validation/validate-all-1.0.js"></script>
	
	
	<title>短信猫配置</title>
	<script type="text/javascript">
	$(document).ready(function(){
		validateSave();
	});
	
	function validateSave(){
		$("#smsGatewaySettingFrom").validate({
			submitHandler: function() {
				ajaxSubmit("smsGatewaySettingFrom",webRoot+"/sms/sms-gateway-setting-saveConfig.htm", "smsGatewaySettingZone",saveCallback);
			},
			rules: {
				gatewayId: "required",
				comName: "required",
				bitTimer: "required",
				creater: "required",
				maxTime: "required"
			},
			messages: {
				gatewayId: "必填",
				comName: "必填",
				bitTimer: "必填",
				creater: "必填",
				maxTime: "必填"
			}
		});
	}
	
	function saveCallback(){
		showMsg();
		validateSave();
	}
	//保存	
	function save(){
		 $("#smsGatewaySettingFrom").submit();
	}
	
	</script>
</head>
<body onload="">
<div class="ui-layout-center">
<div class="opt-body">
	<div class="opt-btn">
		<a class="btn" href="#" onclick="save();"><span><span>保存</span></span></a>
		<a class="btn" href="#" onclick="window.parent.$.colorbox.close();"><span><span>关闭</span></span></a>
	</div>
	<div id="opt-content" >
		<aa:zone name="smsGatewaySettingZone">
			<div id="message" style="display: none;"><s:actionmessage theme="mytheme" /></div>
			
			<form action="" name="smsGatewaySettingFrom" id="smsGatewaySettingFrom" method="post">
				
				<input  type="hidden" name="id" id="id" value="${id}"/>
				<input  type="hidden" name="flag" id="flag" value="smscat"/>
				
				<table class="form-table-without-border">
					<tr>
						<td class="content-title">网关ID：</td>
						<td> <input name="gatewayId" id="gatewayId" maxlength="30" value="${gatewayId }"/> <span class="required">*</span></td>
						<td class="content-title" style="width: 130px;">串口名称：</td>
						<td> <input name="comName" id="comName" maxlength="100" value="${comName }"/> <span class="required">*</span></td>
					</tr>
					
					<tr>
						<td class="content-title" style="width: 130px;">串口每秒发送数据的bit位数：</td>
						<td> <input name="bitTimer" id="bitTimer" maxlength="30" value="${bitTimer }"/> <span class="required">*</span></td>
						<td class="content-title" style="width: 130px;">短信猫生产产商：</td>
						<td> <input name="creater" id="creater" maxlength="100" value="${creater }"/> <span class="required">*</span></td>
					</tr>
					
					<tr>
						<td class="content-title">最大发送次数：</td>
						<td> <input name="maxTime" id="maxTime" maxlength="30" value="${maxTime }"/> <span class="required">*</span></td>
						<td class="content-title" style="width: 130px;">收发设置：</td>
						<td> 
							<select name="sendReceiveStatus" id="sendReceiveStatus" >
							
								<s:iterator value="sendReceiveStatusList" var="var">
									<option value="<s:property value= '#var'/>" <s:if test="#var == smsGatewaySetting.sendReceiveStatus">selected="selected"</s:if>  >
										<s:if test="#var == @com.norteksoft.bs.sms.base.enumeration.SendReceiveStatus@ONLYSEND">仅发送</s:if>
										<s:elseif test="#var == @com.norteksoft.bs.sms.base.enumeration.SendReceiveStatus@OBLYRECEIVE">仅接收</s:elseif>
										<s:elseif test="#var == @com.norteksoft.bs.sms.base.enumeration.SendReceiveStatus@SENDANDRECEIVE">发送并接收</s:elseif>
									</option>
								</s:iterator>
							
							</select>
						</td>
					</tr>
				</table>
			</form>
		</aa:zone>
	</div>
</div>
</div>
</body>
<script type="text/javascript" src="${resourcesCtx}/widgets/colorbox/jquery.colorbox.js"></script>
<script type="text/javascript" src="${resourcesCtx}/widgets/timepicker/timepicker-all-1.0.js"></script>
</html>