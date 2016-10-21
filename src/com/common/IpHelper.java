package com.common;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

/**
 * 
 * @author win7-2
 *
 */
public class IpHelper {
  /**
   * 得到真正的ip地址
   * @param request
   * @return
   */
  public static String getIpAddress(HttpServletRequest request) {
    String ipAddress = request.getHeader("x-forwarded-for");
    if (StringUtils.isBlank(ipAddress)) {
      ipAddress = request.getHeader("Proxy-Client-IP");
    }
    if (StringUtils.isBlank(ipAddress)) {
      ipAddress = request.getHeader("WL-Proxy-Client-IP");
    }
    if (StringUtils.isBlank(ipAddress)) {
      ipAddress = request.getRemoteAddr();
    }
    return ipAddress;
  }
}
