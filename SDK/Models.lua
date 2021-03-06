local utils = require("Utils")

local models = {
	QueueEventConfig = {
		create = function()
			local model = {
				eventId,
				layoutName,
				culture,
				queueDomain,
				extendCookieValidity,
				cookieValidityMinute,
				cookieDomain,
				version,
				getString = function(self)
					return
						"EventId:" .. utils.toString(self.eventId) .. 
						"&Version:" .. utils.toString(self.version) .. 
						"&QueueDomain:" .. utils.toString(self.queueDomain) ..
						"&CookieDomain:" .. utils.toString(self.cookieDomain) .. 
						"&ExtendCookieValidity:" .. utils.toString(self.extendCookieValidity) .. 
						"&CookieValidityMinute:" .. utils.toString(self.cookieValidityMinute) .. 
						"&LayoutName:" .. utils.toString(self.layoutName) .. 
						"&Culture:" .. utils.toString(self.culture)
				end
			}
	
			return model		
		end
	},
	CancelEventConfig = {
		create = function()
			local model = {
				eventId,
				queueDomain,
				cookieDomain,
				version,
				getString = function(self)
					return
						"EventId:" .. utils.toString(self.eventId) .. 
						"&Version:" .. utils.toString(self.version) .. 
						"&QueueDomain:" .. utils.toString(self.queueDomain) ..
						"&CookieDomain:" .. utils.toString(self.cookieDomain)
				end
			}
	
			return model
		end
	},
	RequestValidationResult = {
		create = function(actionType, eventId, queueId, redirectUrl, redirectType)
			local model = {
				eventId = eventId,
				redirectUrl = redirectUrl,
				queueId = queueId,
				actionType = actionType,
				redirectType = redirectType,
				isAjaxResult,
				doRedirect = function(self)
					return utils.toString(self.redirectUrl) ~= ''
				end,
				getAjaxQueueRedirectHeaderKey = function()
					return "x-queueit-redirect"
				end,
				getAjaxRedirectUrl = function(self)
					return utils.urlEncode(utils.toString(self.redirectUrl))
				end
			}

			return model			
		end
	},
	ActionTypes = {
		QueueAction = "Queue",
		CancelAction = "Cancel",
		IgnoreAction = "Ignore"
	}
}

return models