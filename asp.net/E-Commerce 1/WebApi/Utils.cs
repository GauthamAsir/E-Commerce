﻿using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;

namespace WebApi
{
    public class Utils
    {
        public Dictionary<string, string> getRequestData()
        {
            NameValueCollection collection = HttpContext.Current.Request.Form;

            var items = collection.AllKeys.SelectMany(collection.GetValues, (k, v) => new { key = k, value = v });

            //We just collect your multiple form data key/value pair in this dictinary
            //The following code will be replaced by yours
            Dictionary<string, string> keyValuePairs = new Dictionary<string, string>();

            foreach (var item in items)
            {
                keyValuePairs.Add(item.key, item.value);
            }
            return keyValuePairs;
        }
    }
}