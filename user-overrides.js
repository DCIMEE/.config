
// Disable WebRTC
user_pref("media.peerconnection.enabled", false);
// Disable weaker encryption scheme.
user_pref("security.ssl3.deprecated.rsa_des_ede3_sha", true);
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("geo.enabled", false);
user_pref("network.http.sendRefererHeader", 0);
