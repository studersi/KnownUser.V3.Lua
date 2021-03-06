local qitHelpers = require("QueueITHelpers")

function test_ExtractQueueParams()
	queueITToken = "e_testevent1~q_6cf23f10-aca7-4fa2-840e-e10f56aecb44~ts_1486645251~ce_True~cv_3~rt_Queue~h_cb7b7b53fa20e708cb59a5a2696f248cba3b2905d92e12ee5523c298adbef298"                 
	result = qitHelpers.QueueUrlParams.extractQueueParams(queueITToken)
	assert(result.eventId == "testevent1")
	assert(result.timeStamp == 1486645251)
	assert(result.extendableCookie == true)
	assert(result.queueITToken == queueITToken)
	assert(result.cookieValidityMinutes == 3)
	assert(result.queueId == "6cf23f10-aca7-4fa2-840e-e10f56aecb44")
	assert(result.hashCode == "cb7b7b53fa20e708cb59a5a2696f248cba3b2905d92e12ee5523c298adbef298")
	assert(result.queueITTokenWithoutHash == "e_testevent1~q_6cf23f10-aca7-4fa2-840e-e10f56aecb44~ts_1486645251~ce_True~cv_3~rt_Queue")
end
test_ExtractQueueParams()

function test_ExtractQueueParams_NotValidToken()
	queueITToken =  "ts_sasa~cv_adsasa~ce_falwwwse~q_944c1f44-60dd-4e37-aabc-f3e4bb1c8895"
	result = qitHelpers.QueueUrlParams.extractQueueParams(queueITToken)
	assert(result.eventId == "")
	assert(result.timeStamp == 0)
	assert(result.extendableCookie == false)
	assert(result.queueITToken == queueITToken)
	assert(result.cookieValidityMinutes == nil)
	assert(result.hashCode == "")
	assert(result.queueITTokenWithoutHash == "ts_sasa~cv_adsasa~ce_falwwwse~q_944c1f44-60dd-4e37-aabc-f3e4bb1c8895")
end
test_ExtractQueueParams_NotValidToken()