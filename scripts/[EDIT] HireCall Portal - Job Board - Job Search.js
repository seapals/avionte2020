<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0078)https://hir.aviontego.com/Portals/Portals/JobBoard/JobSearch.aspx?CompanyID=HC -->
<html xmlns="http://www.w3.org/1999/xhtml" class="mac chrome chrome8 webkit webkit5">

<head id="ctl00_Head1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- <script type="text/javascript" src="https://hir.aviontego.com/Portals/ig_res/Caribbean/39d17a7039"></script>
        <script src="https://hir.aviontego.com/Portals/ig_res/Caribbean/nr-1167.min.js"></script> -->
        
        <!-- <script type="text/javascript" async="" src="https://hir.aviontego.com/Portals/ig_res/Caribbean/hotjar-1093207.js">
        </script>
        <script type="text/javascript" async="" src="https://hir.aviontego.com/Portals/ig_res/Caribbean/analytics.js">
        </script>
        <script type="text/javascript" async="" src="https://hir.aviontego.com/Portals/ig_res/Caribbean/hotjar-1728674.js">
        </script>
        <script type="text/javascript" async="" src="https://hir.aviontego.com/Portals/ig_res/Caribbean/js"></script>
        <script type="text/javascript" async="" src="https://hir.aviontego.com/Portals/ig_res/Caribbean/js(1)"></script>
        <script async="" src="https://hir.aviontego.com/Portals/ig_res/Caribbean/gtm.js"></script>
        <script async="" src="https://hir.aviontego.com/Portals/ig_res/Caribbean/gtm.js"></script> -->
        <!-- <script type="text/javascript">
            window.NREUM || (NREUM = {});
            NREUM.info = {
                "beacon": "bam.nr-data.net",
                "errorBeacon": "bam.nr-data.net",
                "licenseKey": "39d17a7039",
                "applicationID": "300059836",
                "transactionName": "ZwNVMUBSVkYFABZfW15JdjZiHEhaFhcDWkcfDFgHUFxZRwBMCFlWQwNWF1FbFlQXExo=",
                "queueTime": 2,
                "applicationTime": 1352,
                "agent": "",
                "atts": ""
            }
        </script>
        <script type="text/javascript">
            (window.NREUM || (NREUM = {})).loader_config = {
                licenseKey: "39d17a7039",
                applicationID: "300059836"
            };
            window.NREUM || (NREUM = {}), __nr_require = function (e, n, t) {
                function r(t) {
                    if (!n[t]) {
                        var i = n[t] = {
                            exports: {}
                        };
                        e[t][0].call(i.exports, function (n) {
                            var i = e[t][1][n];
                            return r(i || n)
                        }, i, i.exports)
                    }
                    return n[t].exports
                }
                if ("function" == typeof __nr_require) return __nr_require;
                for (var i = 0; i < t.length; i++) r(t[i]);
                return r
            }({
                1: [function (e, n, t) {
                    function r() {}
                    
                    function i(e, n, t) {
                        return function () {
                            return o(e, [u.now()].concat(f(arguments)), n ? null : this, t), n ?
                            void 0 : this
                        }
                    }
                    var o = e("handle"),
                    a = e(4),
                    f = e(5),
                    c = e("ee").get("tracer"),
                    u = e("loader"),
                    s = NREUM;
                    "undefined" == typeof window.newrelic && (newrelic = s);
                    var p = ["setPageViewName", "setCustomAttribute", "setErrorHandler", "finished",
                    "addToTrace", "inlineHit", "addRelease"
                    ],
                    l = "api-",
                    d = l + "ixn-";
                    a(p, function (e, n) {
                        s[n] = i(l + n, !0, "api")
                    }), s.addPageAction = i(l + "addPageAction", !0), s.setCurrentRouteName = i(l +
                    "routeName", !0), n.exports = newrelic, s.interaction = function () {
                        return (new r).get()
                    };
                    var m = r.prototype = {
                        createTracer: function (e, n) {
                            var t = {},
                            r = this,
                            i = "function" == typeof n;
                            return o(d + "tracer", [u.now(), e, t], r),
                            function () {
                                if (c.emit((i ? "" : "no-") + "fn-start", [u.now(), r, i], t),
                                i) try {
                                    return n.apply(this, arguments)
                                } catch (e) {
                                    throw c.emit("fn-err", [arguments, this, e], t), e
                                } finally {
                                    c.emit("fn-end", [u.now()], t)
                                }
                            }
                        }
                    };
                    a("actionText,setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),
                    function (e, n) {
                        m[n] = i(d + n)
                    }), newrelic.noticeError = function (e, n) {
                        "string" == typeof e && (e = new Error(e)), o("err", [e, u.now(), !1, n])
                    }
                }, {}],
                2: [function (e, n, t) {
                    function r(e, n) {
                        var t = e.getEntries();
                        t.forEach(function (e) {
                            "first-paint" === e.name ? c("timing", ["fp", Math.floor(e
                            .startTime)]) : "first-contentful-paint" === e.name && c("timing", [
                            "fcp", Math.floor(e.startTime)
                            ])
                        })
                    }
                    
                    function i(e, n) {
                        var t = e.getEntries();
                        t.length > 0 && c("lcp", [t[t.length - 1]])
                    }
                    
                    function o(e) {
                        if (e instanceof s && !l) {
                            var n, t = Math.round(e.timeStamp);
                            n = t > 1e12 ? Date.now() - t : u.now() - t, l = !0, c("timing", ["fi", t, {
                                type: e.type,
                                fid: n
                            }])
                        }
                    }
                    if (!("init" in NREUM && "page_view_timing" in NREUM.init && "enabled" in NREUM.init
                    .page_view_timing && NREUM.init.page_view_timing.enabled === !1)) {
                        var a, f, c = e("handle"),
                        u = e("loader"),
                        s = NREUM.o.EV;
                        if ("PerformanceObserver" in window && "function" == typeof window
                        .PerformanceObserver) {
                            a = new PerformanceObserver(r), f = new PerformanceObserver(i);
                            try {
                                a.observe({
                                    entryTypes: ["paint"]
                                }), f.observe({
                                    entryTypes: ["largest-contentful-paint"]
                                })
                            } catch (p) {}
                        }
                        if ("addEventListener" in document) {
                            var l = !1,
                            d = ["click", "keydown", "mousedown", "pointerdown", "touchstart"];
                            d.forEach(function (e) {
                                document.addEventListener(e, o, !1)
                            })
                        }
                    }
                }, {}],
                3: [function (e, n, t) {
                    function r(e, n) {
                        if (!i) return !1;
                        if (e !== i) return !1;
                        if (!n) return !0;
                        if (!o) return !1;
                        for (var t = o.split("."), r = n.split("."), a = 0; a < r.length; a++)
                        if (r[a] !== t[a]) return !1;
                        return !0
                    }
                    var i = null,
                    o = null,
                    a = /Version\/(\S+)\s+Safari/;
                    if (navigator.userAgent) {
                        var f = navigator.userAgent,
                        c = f.match(a);
                        c && f.indexOf("Chrome") === -1 && f.indexOf("Chromium") === -1 && (i = "Safari",
                        o = c[1])
                    }
                    n.exports = {
                        agent: i,
                        version: o,
                        match: r
                    }
                }, {}],
                4: [function (e, n, t) {
                    function r(e, n) {
                        var t = [],
                        r = "",
                        o = 0;
                        for (r in e) i.call(e, r) && (t[o] = n(r, e[r]), o += 1);
                        return t
                    }
                    var i = Object.prototype.hasOwnProperty;
                    n.exports = r
                }, {}],
                5: [function (e, n, t) {
                    function r(e, n, t) {
                        n || (n = 0), "undefined" == typeof t && (t = e ? e.length : 0);
                        for (var r = -1, i = t - n || 0, o = Array(i < 0 ? 0 : i); ++r < i;) o[r] = e[n +
                        r];
                        return o
                    }
                    n.exports = r
                }, {}],
                6: [function (e, n, t) {
                    n.exports = {
                        exists: "undefined" != typeof window.performance && window.performance.timing &&
                        "undefined" != typeof window.performance.timing.navigationStart
                    }
                }, {}],
                ee: [function (e, n, t) {
                    function r() {}
                    
                    function i(e) {
                        function n(e) {
                            return e && e instanceof r ? e : e ? c(e, f, o) : o()
                        }
                        
                        function t(t, r, i, o) {
                            if (!l.aborted || o) {
                                e && e(t, r, i);
                                for (var a = n(i), f = v(t), c = f.length, u = 0; u < c; u++) f[u].apply(a,
                                r);
                                var p = s[y[t]];
                                return p && p.push([b, t, r, a]), a
                            }
                        }
                        
                        function d(e, n) {
                            h[e] = v(e).concat(n)
                        }
                        
                        function m(e, n) {
                            var t = h[e];
                            if (t)
                            for (var r = 0; r < t.length; r++) t[r] === n && t.splice(r, 1)
                        }
                        
                        function v(e) {
                            return h[e] || []
                        }
                        
                        function g(e) {
                            return p[e] = p[e] || i(t)
                        }
                        
                        function w(e, n) {
                            u(e, function (e, t) {
                                n = n || "feature", y[t] = n, n in s || (s[n] = [])
                            })
                        }
                        var h = {},
                        y = {},
                        b = {
                            on: d,
                            addEventListener: d,
                            removeEventListener: m,
                            emit: t,
                            get: g,
                            listeners: v,
                            context: n,
                            buffer: w,
                            abort: a,
                            aborted: !1
                        };
                        return b
                    }
                    
                    function o() {
                        return new r
                    }
                    
                    function a() {
                        (s.api || s.feature) && (l.aborted = !0, s = l.backlog = {})
                    }
                    var f = "nr@context",
                    c = e("gos"),
                    u = e(4),
                    s = {},
                    p = {},
                    l = n.exports = i();
                    l.backlog = s
                }, {}],
                gos: [function (e, n, t) {
                    function r(e, n, t) {
                        if (i.call(e, n)) return e[n];
                        var r = t();
                        if (Object.defineProperty && Object.keys) try {
                            return Object.defineProperty(e, n, {
                                value: r,
                                writable: !0,
                                enumerable: !1
                            }), r
                        } catch (o) {}
                        return e[n] = r, r
                    }
                    var i = Object.prototype.hasOwnProperty;
                    n.exports = r
                }, {}],
                handle: [function (e, n, t) {
                    function r(e, n, t, r) {
                        i.buffer([e], r), i.emit(e, n, t)
                    }
                    var i = e("ee").get("handle");
                    n.exports = r, r.ee = i
                }, {}],
                id: [function (e, n, t) {
                    function r(e) {
                        var n = typeof e;
                        return !e || "object" !== n && "function" !== n ? -1 : e === window ? 0 : a(e, o,
                        function () {
                            return i++
                        })
                    }
                    var i = 1,
                    o = "nr@id",
                    a = e("gos");
                    n.exports = r
                }, {}],
                loader: [function (e, n, t) {
                    function r() {
                        if (!x++) {
                            var e = E.info = NREUM.info,
                            n = d.getElementsByTagName("script")[0];
                            if (setTimeout(s.abort, 3e4), !(e && e.licenseKey && e.applicationID && n))
                            return s.abort();
                            u(y, function (n, t) {
                                e[n] || (e[n] = t)
                            }), c("mark", ["onload", a() + E.offset], null, "api");
                            var t = d.createElement("script");
                            t.src = "https://" + e.agent, n.parentNode.insertBefore(t, n)
                        }
                    }
                    
                    function i() {
                        "complete" === d.readyState && o()
                    }
                    
                    function o() {
                        c("mark", ["domContent", a() + E.offset], null, "api")
                    }
                    
                    function a() {
                        return O.exists && performance.now ? Math.round(performance.now()) : (f = Math.max((
                        new Date).getTime(), f)) - E.offset
                    }
                    var f = (new Date).getTime(),
                    c = e("handle"),
                    u = e(4),
                    s = e("ee"),
                    p = e(3),
                    l = window,
                    d = l.document,
                    m = "addEventListener",
                    v = "attachEvent",
                    g = l.XMLHttpRequest,
                    w = g && g.prototype;
                    NREUM.o = {
                        ST: setTimeout,
                        SI: l.setImmediate,
                        CT: clearTimeout,
                        XHR: g,
                        REQ: l.Request,
                        EV: l.Event,
                        PR: l.Promise,
                        MO: l.MutationObserver
                    };
                    var h = "" + location,
                    y = {
                        beacon: "bam.nr-data.net",
                        errorBeacon: "bam.nr-data.net",
                        agent: "js-agent.newrelic.com/nr-1167.min.js"
                    },
                    b = g && w && w[m] && !/CriOS/.test(navigator.userAgent),
                    E = n.exports = {
                        offset: f,
                        now: a,
                        origin: h,
                        features: {},
                        xhrWrappable: b,
                        userAgent: p
                    };
                    e(1), e(2), d[m] ? (d[m]("DOMContentLoaded", o, !1), l[m]("load", r, !1)) : (d[v](
                    "onreadystatechange", i), l[v]("onload", r)), c("mark", ["firstbyte", f], null,
                    "api");
                    var x = 0,
                    O = e(6)
                }, {}],
                "wrap-function": [function (e, n, t) {
                    function r(e) {
                        return !(e && e instanceof Function && e.apply && !e[a])
                    }
                    var i = e("ee"),
                    o = e(5),
                    a = "nr@original",
                    f = Object.prototype.hasOwnProperty,
                    c = !1;
                    n.exports = function (e, n) {
                        function t(e, n, t, i) {
                            function nrWrapper() {
                                var r, a, f, c;
                                try {
                                    a = this, r = o(arguments), f = "function" == typeof t ? t(r, a) :
                                    t || {}
                                } catch (u) {
                                    l([u, "", [r, a, i], f])
                                }
                                s(n + "start", [r, a, i], f);
                                try {
                                    return c = e.apply(a, r)
                                } catch (p) {
                                    throw s(n + "err", [r, a, p], f), p
                                } finally {
                                    s(n + "end", [r, a, c], f)
                                }
                            }
                            return r(e) ? e : (n || (n = ""), nrWrapper[a] = e, p(e, nrWrapper),
                            nrWrapper)
                        }
                        
                        function u(e, n, i, o) {
                            i || (i = "");
                            var a, f, c, u = "-" === i.charAt(0);
                            for (c = 0; c < n.length; c++) f = n[c], a = e[f], r(a) || (e[f] = t(a, u ?
                            f + i : i, o, f))
                        }
                        
                        function s(t, r, i) {
                            if (!c || n) {
                                var o = c;
                                c = !0;
                                try {
                                    e.emit(t, r, i, n)
                                } catch (a) {
                                    l([a, t, r, i])
                                }
                                c = o
                            }
                        }
                        
                        function p(e, n) {
                            if (Object.defineProperty && Object.keys) try {
                                var t = Object.keys(e);
                                return t.forEach(function (t) {
                                    Object.defineProperty(n, t, {
                                        get: function () {
                                            return e[t]
                                        },
                                        set: function (n) {
                                            return e[t] = n, n
                                        }
                                    })
                                }), n
                            } catch (r) {
                                l([r])
                            }
                            for (var i in e) f.call(e, i) && (n[i] = e[i]);
                            return n
                        }
                        
                        function l(n) {
                            try {
                                e.emit("internal-error", n)
                            } catch (t) {}
                        }
                        return e || (e = i), t.inPlace = u, t.flag = a, t
                    }
                }, {}]
            }, {}, ["loader"]);
        </script> -->
        <title>
            HireCall Portal
        </title>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <link href="https://hir.aviontego.com/Portals/ig_res/Caribbean/ig_shared.css" type="text/css" rel="stylesheet">
        <link href="https://hir.aviontego.com/Portals/ig_res/Caribbean/ig_panel.css" type="text/css" rel="stylesheet">
        <link href="https://hir.aviontego.com/Portals/ig_res/Caribbean/ig_textedit.css" type="text/css" rel="stylesheet">
        <!-- <link id="ctl00_StyleSheet" rel="stylesheet" type="text/css"
            href="https://hir.aviontego.com/Portals/ig_res/Caribbean/HireCall_New_16_2.css"> -->
            <!-- <link id="ctl00_StyleSheet" rel="stylesheet" type="text/css" href="./style.css"> -->
            <link id="ctl00_StyleSheet" rel="stylesheet" type="text/css" href="https://hir.aviontego.com/Portals/Style/HireCall_New_16_2.css">
            
            <style type="text/css">
                .ImageButton {
                    cursor: hand;
                }
                
                .style1 {
                    width: 100%;
                }
            </style>
            
            
            <!-- <script language="JavaScript">
                /* Google Tag Manager */
                (function (w, d, s, l, i) {
                    w[l] = w[l] || [];
                    w[l].push({
                        'gtm.start': new Date().getTime(),
                        event: 'gtm.js'
                    });
                    var f = d.getElementsByTagName(s)[0],
                    j = d.createElement(s),
                    dl = l != 'dataLayer' ? '&l=' + l : '';
                    j.async = true;
                    j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
                    f.parentNode.insertBefore(j, f);
                })(window, document, 'script', 'dataLayer', 'GTM-NHTWFJN');
            </script> -->
            <style type="text/css">
                .ig_2d7b0bce_r1 {
                    width: 165px;
                }
            </style>
            <!-- <script async="" src="https://hir.aviontego.com/Portals/ig_res/Caribbean/modules.4fb2c8f41d571985b5a1.js"
                charset="utf-8"></script> -->
                <style type="text/css">
                    iframe#_hjRemoteVarsFrame {
                        display: none !important;
                        width: 1px !important;
                        height: 1px !important;
                        opacity: 0 !important;
                        pointer-events: none !important;
                    }
                </style>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

                <!-- <script src="https://seapals.github.io/avionte2020/alt.js"></script> -->
                <script src="alt.js"></script>
                
            </head>
            <style id="stylish-1" class="stylish" type="text/css">
                #ctl00_MainContent_HtmlSetting1_WebPanel1_ListBox1 {
                    height: 500px;
                }
            </style>
            
            <body style="zoom: 1;">
                <div id="vc-main">
                    <form method="post" action="https://hir.aviontego.com/Portals/Portals/JobBoard/JobSearch.aspx?CompanyID=HC"
                    onsubmit="javascript:return WebForm_OnSubmit();" id="aspnetForm">
                    <div class="aspNetHidden">
                        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
                        <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
                        <input type="hidden" name="__LASTFOCUS" id="__LASTFOCUS" value="">
                        <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
                        value="/wEPDwUKMTI1MjI0NjAxMw9kFgJmD2QWBGYPZBYCAgYPFgIeBGhyZWYFG1N0eWxlL0hpcmVDYWxsX05ld18xNl8yLmNzc2QCAQ9kFgoCAw8WAh8ABRdodHRwOi8vd3d3LmhpcmVjYWxsLmNvbRYCAgEPFgQeA3NyYwUafi9pbWFnZXMvaGlyZWNhbGxfbG9nby5wbmceA2FsdAUXaHR0cDovL3d3dy5oaXJlY2FsbC5jb21kAgUPFgIfAAUzfi9Qb3J0YWxzL0FwcGxpY2FudC9DcmVhdGVBY2NvdW50LmFzcHg/Q29tcGFueUlEPUhDFgICAQ8WAh8BBRB+XGltYWdlc1xhcHAucG5nZAIHDxYCHwAFGGh0dHA6Ly93d3cuaGlyZWNhbGwuY29tLxYCAgEPFgIfAQURflxpbWFnZXNcaG9tZS5wbmdkAgsPZBYCZg9kFgICAw9kFgICAQ9kFgJmD2QWBgIBD2QWAgIBDw9kPCsABQEAD2Q8KwAEAQAPZGQWDgIHDxAPFgoeBVdpZHRoGwAAAAAAQGVAAQAAAB4NRGF0YVRleHRGaWVsZAUIQ2F0ZWdvcnkeDkRhdGFWYWx1ZUZpZWxkBQhDYXRlZ29yeR4LXyFEYXRhQm91bmRnHgRfIVNCAoACZBAVCgNBbGwKQWNjb3VudGluZwhDbGVyaWNhbAlFZHVjYXRpb24NR2VuZXJhbCBMYWJvcgpJbmR1c3RyaWFsB01lZGljYWwVUmlzay9MZWdhbC9Db21wbGlhbmNlBVNhbGVzCVdhcmVob3VzZRUKA0FsbApBY2NvdW50aW5nCENsZXJpY2FsCUVkdWNhdGlvbg1HZW5lcmFsIExhYm9yCkluZHVzdHJpYWwHTWVkaWNhbBVSaXNrL0xlZ2FsL0NvbXBsaWFuY2UFU2FsZXMJV2FyZWhvdXNlFCsDCmdnZ2dnZ2dnZ2dkZAILDxAPFgofAxsAAAAAAEBlQAEAAAAfBAUISm9iVGl0bGUfBQUISm9iVGl0bGUfBmcfBwKAAmQQFQ8DQWxsEEFjY291bnRpbmcgQ2xlcmsTQ2xhc3Nyb29tIEFzc2lzdGFudB5DcmltaW5hbCBCYWNrZ3JvdW5kIFJlc2VhcmNoZXIQQ3VzdG9tZXIgU2VydmljZRBHZW5lcmFsIENsZXJpY2FsEUdlbmVyYWwgV2FyZWhvdXNlEkluZHVzdHJpYWwgUGFpbnRlcg9MZWdhbCBBc3Npc3RhbnQKTG9hbiBDbGVyaxRNZWNoYW5pY2FsIEFzc2VtYmxlchRNZWRpY2FsIEZyb250IE9mZmljZQpQcm9kdWN0aW9uBVNhbGVzF1ZlcmlmaWNhdGlvbiBTcGVjaWFsaXN0FQ8DQWxsEEFjY291bnRpbmcgQ2xlcmsTQ2xhc3Nyb29tIEFzc2lzdGFudB5DcmltaW5hbCBCYWNrZ3JvdW5kIFJlc2VhcmNoZXIQQ3VzdG9tZXIgU2VydmljZRBHZW5lcmFsIENsZXJpY2FsEUdlbmVyYWwgV2FyZWhvdXNlEkluZHVzdHJpYWwgUGFpbnRlcg9MZWdhbCBBc3Npc3RhbnQKTG9hbiBDbGVyaxRNZWNoYW5pY2FsIEFzc2VtYmxlchRNZWRpY2FsIEZyb250IE9mZmljZQpQcm9kdWN0aW9uBVNhbGVzF1ZlcmlmaWNhdGlvbiBTcGVjaWFsaXN0FCsDD2dnZ2dnZ2dnZ2dnZ2dnZ2RkAg8PEA8WCh8DGwAAAAAAQGVAAQAAAB8EBQ5DaG9pY2VDb2RlRGVzYx8FBQ5DaG9pY2VDb2RlRGVzYx8GZx8HAoACZBAVBANBbGwLRGlyZWN0IEhpcmUEVEVNUAxUZW1wIFRvIFBlcm0VBANBbGwLRGlyZWN0IEhpcmUEVEVNUAxUZW1wIFRvIFBlcm0UKwMEZ2dnZ2RkAhMPEA8WCh8DGwAAAAAAQGVAAQAAAB8EBQRDaXR5HwUFBENpdHkfBmcfBwKAAmQQFQQDQWxsBlJlbnRvbgZTdW1uZXIFVHVsc2EVBANBbGwGUmVudG9uBlN1bW5lcgVUdWxzYRQrAwRnZ2dnZGQCFQ8PFgIeBFRleHQFBVN0YXRlZGQCFw8QDxYKHwMbAAAAAABAZUABAAAAHwQFBXN0YXRlHwUFBXN0YXRlHwZnHwcCgAJkEBUDA0FsbAJPSwJXQRUDA0FsbAJPSwJXQRQrAwNnZ2dkZAIZD2QWBgIBDw8WAh8IBQhaaXAgQ29kZWRkAgkPEA8WBB8DGwAAAAAAQGVAAQAAAB8HAoACZA8WBmYCAQICAgMCBAIFFgYQBQNBbGwFBDk5OTlnEAUHMTAgTWlsZQUCMTBnEAUHMjUgTWlsZQUCMjVnEAUHNTAgTWlsZQUCNTBnEAUHNzUgTWlsZQUCNzVnEAUIMTAwIE1pbGUFAzEwMGdkZAILDw8WAh8IBTY8Yj4qKjwvYj4gVG8gdXNlIFJhZGl1cyBzZWFyY2gsIHBsZWFzZSBpbnB1dCBhIFppcENvZGVkZAIDDw8WAh8IBU1DaG9vc2UgYSBjYXRlZ29yeSBhYm92ZSwgaWYgYXBwbGljYWJsZSwgYW5kIGNsaWNrIHNlYXJjaCB0byBmaW5kIG9wZW4gb3JkZXJzLmRkAgkPDxYCHgdWaXNpYmxlZ2QWAgIBD2QWAgIBDw9kPCsABQEAD2Q8KwAEAQAPZGQWBAIDDxBkZBYBZmQCBQ88KwARAwAPFgQfBmceC18hSXRlbUNvdW50AhNkARAWABYAFgAMFCsAABYCZg9kFg5mDw8WAh8JaGRkAgEPZBYCZg9kFhgCAw8PFgIfCAUKTG9hbiBDbGVya2RkAgcPDxYCHwgFCENsZXJpY2FsZGQCCw8PFgIfCAUFVHVsc2FkZAINDw8WAh8IBQZTdGF0ZTpkZAIPDw8WAh8IBQJPS2RkAhMPDxYCHwgFC0ZpcnN0IFNoaWZ0ZGQCFw8PFgIfCGVkZAIZDw8WAh8JaGQWBAIBD2QWAgIDDw8WAh8IBQowMy8xMC8yMDIwZGQCAw9kFgICAw8PFgIfCAUKMDMvMTAvMjAyMGRkAh0PDxYCHwhlZGQCIQ8PFgIfCGVkZAIlDw8WAh8IBSQ3YzBlZjU3OC0xNTYzLWVhMTEtOTQzMC0wMDUwNTY5YjEwMzhkZAInDw8WAh8IBQQ5NTAxZGQCAg9kFgJmD2QWGAIDDw8WAh8IBRRNZWRpY2FsIEZyb250IE9mZmljZWRkAgcPDxYCHwgFB01lZGljYWxkZAILDw8WAh8IBQVUdWxzYWRkAg0PDxYCHwgFBlN0YXRlOmRkAg8PDxYCHwgFAk9LZGQCEw8PFgIfCAULRmlyc3QgU2hpZnRkZAIXDw8WAh8IZWRkAhkPDxYCHwloZBYEAgEPZBYCAgMPDxYCHwgFCjAzLzEwLzIwMjBkZAIDD2QWAgIDDw8WAh8IBQowMy8xMC8yMDIwZGQCHQ8PFgIfCGVkZAIhDw8WAh8IZWRkAiUPDxYCHwgFJDA4NTU0ZmI0LTEyNjMtZWExMS05NDMwLTAwNTA1NjliMTAzOGRkAicPDxYCHwgFBDk1MDBkZAIDD2QWAmYPZBYYAgMPDxYCHwgFFE1lZGljYWwgRnJvbnQgT2ZmaWNlZGQCBw8PFgIfCAUHTWVkaWNhbGRkAgsPDxYCHwgFBVR1bHNhZGQCDQ8PFgIfCAUGU3RhdGU6ZGQCDw8PFgIfCAUCT0tkZAITDw8WAh8IBQtGaXJzdCBTaGlmdGRkAhcPDxYCHwhlZGQCGQ8PFgIfCWhkFgQCAQ9kFgICAw8PFgIfCAUKMDIvMjYvMjAyMGRkAgMPZBYCAgMPDxYCHwgFCjAyLzI2LzIwMjBkZAIdDw8WAh8IZWRkAiEPDxYCHwhlZGQCJQ8PFgIfCAUkNzkyMmUwNmQtZTY1OC1lYTExLTk0MzAtMDA1MDU2OWIxMDM4ZGQCJw8PFgIfCAUEOTQ5MWRkAgQPZBYCZg9kFhgCAw8PFgIfCAURR2VuZXJhbCBXYXJlaG91c2VkZAIHDw8WAh8IBQlXYXJlaG91c2VkZAILDw8WAh8IBQVUdWxzYWRkAg0PDxYCHwgFBlN0YXRlOmRkAg8PDxYCHwgFAk9LZGQCEw8PFgIfCAUDMXN0ZGQCFw8PFgIfCGVkZAIZDw8WAh8JaGQWBAIBD2QWAgIDDw8WAh8IBQowMi8yNC8yMDIwZGQCAw9kFgICAw8PFgIfCAUKMDIvMjQvMjAyMGRkAh0PDxYCHwgFBTEyLjAwZGQCIQ8PFgIfCGVkZAIlDw8WAh8IBSQ4NGNmOTU3Yy0zMDU3LWVhMTEtOTQzMC0wMDUwNTY5YjEwMzhkZAInDw8WAh8IBQQ5NDg4ZGQCBQ9kFgJmD2QWGAIDDw8WAh8IBRBDdXN0b21lciBTZXJ2aWNlZGQCBw8PFgIfCAUIQ2xlcmljYWxkZAILDw8WAh8IBQVUdWxzYWRkAg0PDxYCHwgFBlN0YXRlOmRkAg8PDxYCHwgFAk9LZGQCEw8PFgIfCAUDMXN0ZGQCFw8PFgIfCGVkZAIZDw8WAh8JaGQWBAIBD2QWAgIDDw8WAh8IBQowMi8yMS8yMDIwZGQCAw9kFgICAw8PFgIfCAUKMDIvMjEvMjAyMGRkAh0PDxYCHwgFDyQxMy4wMCAtICQxMy4wMGRkAiEPDxYCHwhlZGQCJQ8PFgIfCAUkYTJmMzc4N2QtYjc1NC1lYTExLTk0MzAtMDA1MDU2OWIxMDM4ZGQCJw8PFgIfCAUEOTQ4NmRkAgYPDxYCHwloZGQCEQ8PFgIfCAV4Q29weXJpZ2h0ICZjb3B5OyAyMDE0IEhpcmVDYWxsLCBMTEM8YnIgLz48YSBocmVmPSdodHRwOi8vd3d3LmhpcmVjYWxsLmNvbS8nIHRhcmdldD0nX2JsYW5rJz5odHRwOi8vd3d3LmhpcmVjYWxsLmNvbS88L2E+ZGQYAgUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgMFM2N0bDAwJENvbnRlbnRQbGFjZUhvbGRlcjEkSm9iQm9hcmRTZWFyY2gxJFdlYlBhbmVsMQU+Y3RsMDAkQ29udGVudFBsYWNlSG9sZGVyMSRKb2JCb2FyZFNlYXJjaDEkV2ViUGFuZWwxJHppcENvZGVUeHQFMGN0bDAwJENvbnRlbnRQbGFjZUhvbGRlcjEkSm9iTGlzdEl0ZW0xJFdlYlBhbmVsMQU6Y3RsMDAkQ29udGVudFBsYWNlSG9sZGVyMSRKb2JMaXN0SXRlbTEkV2ViUGFuZWwxJEdyaWRWaWV3MQ88KwAMAQgCBGS12SCleMBkd/WuD/tcOUoyZsGIPQ==">
                    </div>
                    
                    <!-- <script type="text/javascript">
                        //<![CDATA[
                        var theForm = document.forms['aspnetForm'];
                        if (!theForm) {
                            theForm = document.aspnetForm;
                        }
                        
                        function __doPostBack(eventTarget, eventArgument) {
                            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                                theForm.__EVENTTARGET.value = eventTarget;
                                theForm.__EVENTARGUMENT.value = eventArgument;
                                theForm.submit();
                            }
                        }
                        //]]>
                    </script>
                    
                    
                    <script src="https://hir.aviontego.com/Portals/ig_res/Caribbean/WebResource.axd" type="text/javascript">
                    </script>
                    
                    <script type="text/javascript">
                        //<![CDATA[
                        var ig_pi_imageUrl =
                        'https://hir.aviontego.com/portals/WebResource.axd?d=noYPctyaOugf8bkXPq_FMXFPFncnDBlZK7HhzI6X1jtk4OFlH8ntmsDlRbeciMaxSNadT_jUaTcv2zn-qdty3OWzGhZOTWX0q_A6SPnuoXJoDRSAxTTv_cdEbbutsw09dyeJhI1E6SlZ3xt63crT2WmLeMJfTCNvoe6t1jYp_mkW1VkpTLib8zbx-7XVPYG8bf_Mrg2&t=637193635500000000';
                        try {
                            (new Image()).src = ig_pi_imageUrl;
                        } catch (ex) {}
                        //]]>
                    </script>
                    <script src="https://hir.aviontego.com/Portals/ig_res/Caribbean/ScriptResource.axd" type="text/javascript">
                    </script>
                    <script src="https://hir.aviontego.com/Portals/ig_res/Caribbean/ScriptResource(1).axd" type="text/javascript">
                    </script>
                    <script src="https://hir.aviontego.com/Portals/ig_res/Caribbean/ScriptResource(2).axd" type="text/javascript">
                    </script>
                    <script src="https://hir.aviontego.com/Portals/ig_res/Caribbean/ScriptResource(3).axd" type="text/javascript">
                    </script>
                    <script src="https://hir.aviontego.com/Portals/ig_res/Caribbean/ScriptResource(4).axd" type="text/javascript">
                    </script>
                    <script src="https://hir.aviontego.com/Portals/ig_res/Caribbean/ScriptResource(5).axd" type="text/javascript">
                    </script>
                    <script type="text/javascript">
                        //<![CDATA[
                        function WebForm_OnSubmit() {
                            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
                            return true;
                        }
                        //]]>
                    </script> -->
                    
                    <div class="aspNetHidden">
                        
                        <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="E5DC5014">
                        <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
                        value="/wEdAEfm042XMXvMC0PGJlbHyTk1Bu2HqYGavPrKlGD/sv1OyJk3XMqmwupd9JYivzhl9cK9uu6fWTF0xZHila8fPmRarBoQyAeO37X0CAAjNMo7j1fYA0CmyrcPp5wIgn9IdRR+B9WurT0RBq9s3xN5zwObtwPeu7qZqToIaQRFBWGhxf6mehH7GSndnEVWHywqJrN5cIfk47aqwdDRos9v68gDkBVPQ48yvDjZbch1+x9dsHcmiD8U157K3CjUqBam2ccwF1qXVtoMdgb/HPL1ZwhhTYbALTet8X5HWw8/CuqO3DmN8pTM/vhy705FSsXLQyjNHaeFHC1QgDmzoze+97sXXYY2dYjObHKjcLtvBE0K4x5/3UCeJx7nszt6dnlb+kGM03s64bFaGQJ2vAD9UKwV4HwrFO6HWmXKXfqX/M0FiRESeUAudaRKg8XWRBXfJ5W0+KFdd0LtkTYIzH7jDY3cfSq9BB7+/zdPSfU8DzfcMl1PwpcrjQR+0L962SGTSYxy4sLnPR2E8MuUQgsrNDW66KoyQ/4BGcw3AnJ7/NkHd6eC0as+dZMdYMkNoBv7lfmTfT1C82ORqKuO3KKTP2KUBRymvr1g5Nz/oAoARAJ3o90ZnNJR039lJqn3Uz9R4vJ/n6TzhmSZ0W7RmZUxV7m+14wX2fVcay4NYQMW9iYkuR2zyXdo0CDtOWCJHLuR2zeNDvaPln2pXeXkEATG/Er0yuw6wPF6Ik54rtzP4/EUyPEwQ6Qy01GTCQqSjLKcEMsx26OVkTFJMdnS2bqHbr1CQsKo2Px2O4YY6uhkFZ5Y7EEQ1g/i53p/QvSZ5nVet8m0g5T96YWfHSg8vCm1pKkCBQwBVSHvSHrVc6BlfcUC5WJL4CK9Es332yasGT+P/ezD4KhrVyeVGT5F3IAenW3vk0ZPZuxgMeVKYRoKtQ9okow7t+aOQlJ+rpluCTaRNaeK2mkGhZ1ymi7jtbCkZuHvAkwoe7/fx0rHOtCX/og4BHu3gCLwW3ywWdtWU6KxYQJ0fTLjFIKmC6IU5PQnpu4ePMxi+vhlkDVsHLLwt54M9s0mWW19jNl0T7YkPNCF7A5826QESE6RY2PjwJmb225V44eIRt2/JKcijDHr9wkwmwjIS59gUIhA+ot/FleajK9QXyc9nk87y1oUQOuTJHlYkCk1Ei10VSxnz+Lmpdwoo9fvvo6iyCVq3golTLSd06oX7+YgEQa6GOkQwogSWmTpQaTakxIEBGjgJxYN9GVnbGt2hBs+f7RhXeBNlefgDbeckRNqePXBdhmhSTE39Nz22uk8RjiMN0EhKbzomD5aykDkOUT6Rm3HK93foZeAQlKj11szWBNJOEW0doI1YYohvwz/uksrj39dyUTREDApM9v0wUhYmGW3ZPTKyFzvJ1bYW0uS+9YlCfb1bsp7IljBrppdp77p2f5JzZwI80RyguugkiwXrE5OCo1VjgZ9Gq1X6Xwqq6QyYxqFzQ/7SpJuiOZklp0ZzYteOWw32i4ghBTOAXBWpXH68dTeCKTDDL7u5Bo7">
                    </div>
                    <div class="applicant_container">
                        <div>
                            <!-- <script type="text/javascript">
                                //<![CDATA[
                                Sys.WebForms.PageRequestManager._initialize('ctl00$ScriptManager1', 'aspnetForm', [
                                'tctl00$updatePanelMainContent', '', 'tctl00$ContentPlaceHolder1$UpdatePanel2', ''
                                ], ['ctl00$ScriptManager1', ''], [], 90, 'ctl00');
                                //]]>
                            </script>
                            <input type="hidden" name="ctl00$ScriptManager1" id="ctl00_ScriptManager1">
                            <script type="text/javascript">
                                //<![CDATA[
                                Sys.Application.setServerId("ctl00_ScriptManager1", "ctl00$ScriptManager1");
                                Sys.Application._enableHistoryInScriptManager();
                                //]]>
                            </script> -->
                            
                        </div>
                        
                        <div id="header" align="right" dir="ltr">
                            <div id="header_leftImg">
                                <div id="header_logo" align="left">
                                    <a href="http://www.hirecall.com/" id="ctl00_lnkLogo">
                                        <img src="https://hir.aviontego.com/Portals/images/hirecall_logo.png"
                                        id="ctl00_ImgLogo" class="header_logo_style" alt="http://www.hirecall.com">
                                    </a>
                                </div>
                            </div>
                            <a href="https://hir.aviontego.com/Portals/Portals/Applicant/CreateAccount.aspx?CompanyID=HC"
                            id="ctl00_ApplyLogoLink">
                            <img src="https://hir.aviontego.com/Portals/ig_res/Caribbean/app.png" id="ctl00_ImageButton1"
                            class="ImageButton" title="Click to apply online.">
                        </a>
                        <a href="http://www.hirecall.com/" id="ctl00_HostLogoLink">
                            <img src="https://hir.aviontego.com/Portals/ig_res/Caribbean/home.png" id="ctl00_ImageButton2"
                            class="ImageButton" title="Click to go home site.">
                        </a>
                    </div>
                    
                    <div id="secondaryNav">
                        <div id="secondaryNav_right"><img
                            src="https://hir.aviontego.com/Portals/ig_res/Caribbean/secondaryNavBG_right.jpg"
                            id="ctl00_Img2"></div>
                            <br style="clear: both;">
                        </div>
                        
                        <div id="mainContentAll">
                            <table border="0" width="100%" height="100%" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td width="100%" valign="middle" align="center">
                                            <div id="ctl00_updatePanelMainContent">
                                                
                                                <div id="applicantCenter">
                                                    <div id="mainContentHeader">
                                                        <table width="100%">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="width:600px"></td>
                                                                    <td align="right">
                                                                        <div id="ctl00_divAddThis"></div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        
                                                        
                                                        <p> </p>
                                                        <div>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    
                                                    
                                                    <div id="mainContentLeft">
                                                        
                                                        
                                                        <div id="ctl00_ContentPlaceHolder1_UpdatePanel2">
                                                            
                                                            <table style="width: 100%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            
                                                                            
                                                                            
                                                                            <script type="text/javascript">
                                                                                function CheckKey(e) {
                                                                                    var key = e.keyCode || e.which;
                                                                                    if (key == 13) {
                                                                                        //            event.returnValue = false;
                                                                                        //            event.cancel = true;
                                                                                        return false;
                                                                                    }
                                                                                }
                                                                                
                                                                                function WebMaskEditKeyDown(oEdit, keyCode,
                                                                                oEvent) {
                                                                                    if (keyCode == 13)
                                                                                    oEvent.cancel = true;
                                                                                }
                                                                            </script>
                                                                            
                                                                            <div>
                                                                                <div>
                                                                                    <input type="hidden"
                                                                                    id="ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1_hidden"
                                                                                    name="ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1_hidden">
                                                                                    <table
                                                                                    id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1"
                                                                                    class="ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1ctl ig_CaribbeanControl igpnl_CaribbeanControl"
                                                                                    cellspacing="0" cellpadding="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td class="ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1hdrxpnd  ig_CaribbeanHeader igpnl_CaribbeanHeaderExpanded"
                                                                                            id="ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1_header"
                                                                                            align="Center"
                                                                                            style="display:;"><img
                                                                                            id="ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1_header_img"
                                                                                            collapsedurl="../../ig_res/Caribbean/images/igpnl_dwn.gif"
                                                                                            expandedurl="../../ig_res/Caribbean/images/igpnl_up.gif"
                                                                                            src="https://hir.aviontego.com/Portals/ig_res/Caribbean/igpnl_up.gif"
                                                                                            style="height:0px;float:right">
                                                                                            <div
                                                                                            class="groupbox_header_style">
                                                                                            <div
                                                                                            class="groupbox_left_top_corner">
                                                                                        </div>
                                                                                        <div
                                                                                        class="groupbox_header_title_style">
                                                                                        Job Search
                                                                                    </div>
                                                                                    <div
                                                                                    class="groupbox_right_top_corner">
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1pnl  igpnl_CaribbeanPanel"
                                                                        id="ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1_content"
                                                                        style="width:100%;height:100%;">
                                                                        <div
                                                                        style="height:100%;width:100%;">
                                                                        
                                                                        <div
                                                                        class="groupbox_body_style">
                                                                        <div
                                                                        class="groupbox_body_inner_style">
                                                                        <table
                                                                        style="width:100%">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td
                                                                                style="width:60%">
                                                                                <table
                                                                                style="width:100%">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td
                                                                                        style="width:35%">
                                                                                        <span
                                                                                        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_keywordsLbl"
                                                                                        class="label_bold_style">Keyword(s)</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <input
                                                                                        name="ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1$keywordSearchTxt"
                                                                                        type="text"
                                                                                        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_keywordSearchTxt"
                                                                                        onkeydown="return CheckKey(event)"
                                                                                        style="width:165px;">
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span
                                                                                        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_categoryLbl"
                                                                                        class="label_bold_style">Job
                                                                                        Category</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <select
                                                                                        name="ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1$categoryDdl"
                                                                                        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_categoryDdl"
                                                                                        style="width:170px;">
                                                                                        <option
                                                                                        selected="selected"
                                                                                        value="All">
                                                                                        All
                                                                                    </option>
                                                                                    <option
                                                                                    value="Accounting">
                                                                                    Accounting
                                                                                </option>
                                                                                <option
                                                                                value="Clerical">
                                                                                Clerical
                                                                            </option>
                                                                            <option
                                                                            value="Education">
                                                                            Education
                                                                        </option>
                                                                        <option
                                                                        value="General Labor">
                                                                        General
                                                                        Labor
                                                                    </option>
                                                                    <option
                                                                    value="Industrial">
                                                                    Industrial
                                                                </option>
                                                                <option
                                                                value="Medical">
                                                                Medical
                                                            </option>
                                                            <option
                                                            value="Risk/Legal/Compliance">
                                                            Risk/Legal/Compliance
                                                        </option>
                                                        <option
                                                        value="Sales">
                                                        Sales
                                                    </option>
                                                    <option
                                                    value="Warehouse">
                                                    Warehouse
                                                </option>
                                                
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span
                                            id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_jobTitleLbl"
                                            class="label_bold_style">Job
                                            Title</span>
                                        </td>
                                        <td>
                                            <select
                                            name="ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1$jobTitleDdl"
                                            id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_jobTitleDdl"
                                            style="width:170px;">
                                            <option
                                            selected="selected"
                                            value="All">
                                            All
                                        </option>
                                        <option
                                        value="Accounting Clerk">
                                        Accounting
                                        Clerk
                                    </option>
                                    <option
                                    value="Classroom Assistant">
                                    Classroom
                                    Assistant
                                </option>
                                <option
                                value="Criminal Background Researcher">
                                Criminal
                                Background
                                Researcher
                            </option>
                            <option
                            value="Customer Service">
                            Customer
                            Service
                        </option>
                        <option
                        value="General Clerical">
                        General
                        Clerical
                    </option>
                    <option
                    value="General Warehouse">
                    General
                    Warehouse
                </option>
                <option
                value="Industrial Painter">
                Industrial
                Painter
            </option>
            <option
            value="Legal Assistant">
            Legal
            Assistant
        </option>
        <option
        value="Loan Clerk">
        Loan
        Clerk
    </option>
    <option
    value="Mechanical Assembler">
    Mechanical
    Assembler
</option>
<option
value="Medical Front Office">
Medical
Front
Office
</option>
<option
value="Production">
Production
</option>
<option
value="Sales">
Sales
</option>
<option
value="Verification Specialist">
Verification
Specialist
</option>

</select>
</td>
</tr>
<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_orderTypeLbl"
        class="label_bold_style">Employment
        Category</span>
    </td>
    <td>
        <select
        name="ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1$orderTypeDdl"
        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_orderTypeDdl"
        style="width:170px;">
        <option
        selected="selected"
        value="All">
        All
    </option>
    <option
    value="Direct Hire">
    Direct
    Hire
</option>
<option
value="TEMP">
TEMP
</option>
<option
value="Temp To Perm">
Temp
To
Perm
</option>

</select>
</td>
</tr>
<tr>
    <td>
    </td>
    <td>
    </td>
</tr>
</tbody>
</table>
</td>
<td>
    <table
    style=" width:100%">
    <tbody>
        <tr>
            <td>
                <table
                style=" width:100%">
                <tbody>
                    <tr>
                        <td
                        style="width:30%">
                        
                        <span
                        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_citylbl"
                        class="label_bold_style">City</span>
                        
                    </td>
                    <td>
                        
                        <select
                        name="ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1$cityDdl"
                        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_cityDdl"
                        style="width:170px;">
                        <option
                        selected="selected"
                        value="All">
                        All
                    </option>
                    <option
                    value="Renton">
                    Renton
                </option>
                <option
                value="Sumner">
                Sumner
            </option>
            <option
            value="Tulsa">
            Tulsa
        </option>
        
    </select>
    
</td>
</tr>
<tr>
    <td>
        
        <span
        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_citylbl0"
        class="label_bold_style">State</span>
        
    </td>
    <td>
        
        <select
        name="ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1$stateDdl"
        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_stateDdl"
        style="width:170px;">
        <option
        selected="selected"
        value="All">
        All
    </option>
    <option
    value="OK">
    OK
</option>
<option
value="WA">
WA
</option>

</select>

</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
    <td>
        <div
        id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_pnlRadiusSearch">
        
        
        
        
        <table
        style="width:100%; border-color:Black; border-style:solid; border-width:1px;">
        <tbody>
            <tr>
                <td
                style="width:30%">
                <span
                id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_lblZip"
                class="label_bold_style">Zip
                Code</span>
            </td>
            <td>
                <input
                type="hidden"
                name="ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1$zipCodeTxt"
                id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_zipCodeTxt"
                value=""><input
                type="hidden"
                name="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_zipCodeTxt_p"
                id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_zipCodeTxt_p"
                value=""><input
                type="text"
                style="width:165px;"
                class="ig_CaribbeanEdit igtxt_CaribbeanEdit ig_2d7b0bce_r1 answer_box_style"
                id="igtxtctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_zipCodeTxt"
                editid="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_zipCodeTxt">
                <span
                id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_CustomValidator_ZipCode"
                style="visibility:hidden;">*</span>
            </td>
        </tr>
        <tr>
            <td>
                <span
                id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_Label1"
                class="label_bold_style">Radius</span>
            </td>
            <td>
                <select
                name="ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1$RadiusDdl"
                id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_RadiusDdl"
                style="width:170px;margin-bottom: 0px">
                <option
                selected="selected"
                value="9999">
                All
            </option>
            <option
            value="10">
            10
            Mile
        </option>
        <option
        value="25">
        25
        Mile
    </option>
    <option
    value="50">
    50
    Mile
</option>
<option
value="75">
75
Mile
</option>
<option
value="100">
100
Mile
</option>

</select>
</td>
</tr>
<tr>
    <td
    colspan="2">
    <span
    id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_lblRadiusNote"
    style="font-size:Small;"><b>**</b>
    To
    use
    Radius
    search,
    please
    input
    a
    ZipCode</span>
</td>
</tr>
</tbody>
</table>


</div>


</td>
</tr>
</tbody>
</table>

</td>
</tr>
<tr>
    <td
    colspan="2">
    
    <div id="ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_ValidationSummary1"
    style="display:none;">
    
</div>

</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</td>
</tr>
</tbody>
</table>
<style type="text/css">
    .ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1ctl {
        width: 100%;
    }
    
    .ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1hdrxpnd {
        cursor: pointer;
    }
</style>
</div>

</div>


</td>
</tr>
<tr>
    <td>
        <span id="ctl00_ContentPlaceHolder1_lblNote">Choose
            a category above, if applicable, and click
            search to find open orders.</span>
        </td>
    </tr>
    <tr>
        <td>
            <input type="submit"
            name="ctl00$ContentPlaceHolder1$Button1"
            value="Search"
            onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$Button1&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, false))"
            id="ctl00_ContentPlaceHolder1_Button1"
            class="button_large">
            <input type="submit"
            name="ctl00$ContentPlaceHolder1$Button2"
            value="Reset"
            id="ctl00_ContentPlaceHolder1_Button2"
            class="button_large">
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <div id="ctl00_ContentPlaceHolder1_Panel1">
                
                
                
                <style type="text/css">
                    .style1 {
                        width: 100%;
                    }
                    
                    .ImageButton {
                        cursor: hand;
                    }
                </style>
                
                <div>
                    <div>
                        <input type="hidden"
                        id="ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1_hidden"
                        name="ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1_hidden">
                        <table
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1"
                        class="ctl00ContentPlaceHolder1JobListItem1WebPanel1ctl ig_CaribbeanControl igpnl_CaribbeanControl"
                        cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td class="ctl00ContentPlaceHolder1JobListItem1WebPanel1hdrxpnd webpanel_header_hide_style ig_CaribbeanHeader igpnl_CaribbeanHeaderExpanded"
                                id="ctl00ContentPlaceHolder1JobListItem1WebPanel1_header"
                                align="Center"
                                style="display:;"><img
                                id="ctl00ContentPlaceHolder1JobListItem1WebPanel1_header_img"
                                collapsedurl="../../ig_res/Caribbean/images/igpnl_dwn.gif"
                                expandedurl="../../ig_res/Caribbean/images/igpnl_up.gif"
                                src="https://hir.aviontego.com/Portals/ig_res/Caribbean/igpnl_up.gif"
                                style="height:0px;float:right">
                            </td>
                        </tr>
                        <tr>
                            <td class="ctl00ContentPlaceHolder1JobListItem1WebPanel1pnl  igpnl_CaribbeanPanel"
                            id="ctl00ContentPlaceHolder1JobListItem1WebPanel1_content"
                            style="width:100%;height:100%;">
                            <div
                            style="height:100%;width:100%;">
                            <div
                            class="groupbox_header_style">
                            <div
                            class="groupbox_left_top_corner">
                        </div>
                        <div
                        class="groupbox_header_title_style">
                        <table
                        class="style1"
                        width="100%">
                        <tbody>
                            <tr>
                                <td
                                align="left">
                                Job
                                List
                            </td>
                            <td
                            align="right">
                            &nbsp;
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="groupbox_right_top_corner"
        align="right">
        
    </div>
</div>
<div
class="groupbox_body_style">
<div
class="groupbox_body_inner_style">
<table
class="table_outer"
width="99%">
<tbody>
    <tr>
        <td
        align="right">
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_Label12">Rows
        /Page</span>
        <select
        name="ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1$ddlPage"
        onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1$ddlPage\&#39;,\&#39;\&#39;)&#39;, 0)"
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_ddlPage">
        <option
        selected="selected"
        value="5">
        5
    </option>
    <option
    value="10">
    10
</option>
<option
value="25">
25
</option>
<option
value="50">
50
</option>
<option
value="100">
100
</option>
<option
value="9999">
All
</option>

</select>
</td>
</tr>
<tr>
    <td>
        
        <div>
            <table
            cellspacing="0"
            rules="all"
            border="1"
            id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1"
            style="width:100%;border-collapse:collapse;">
            <tbody>
                <tr>
                    <td>
                        
                        <table
                        class="style1">
                        <tbody>
                            <tr>
                                <td
                                width="15%">
                                <span
                                id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_Label1"
                                class="label_bold_style">Position:</span>
                            </td>
                            <td
                            width="45%">
                            <span
                            id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_lblTitle"
                            class="label_bold_style">Loan
                            Clerk</span>
                        </td>
                        <td
                        width="15%">
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_Label4"
                        class="label_bold_style">Category:</span>
                    </td>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_lblCategory">Clerical</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_Label8"
                        class="label_bold_style">City:</span>
                    </td>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_lblCity">Tulsa</span>
                    </td>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_LabelState"
                        class="label_bold_style">State:</span>
                    </td>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_lblState">OK</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_Label2"
                        class="label_bold_style">Shift:</span>
                    </td>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_lblShift">First
                        Shift</span>
                    </td>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_Label10"
                        class="label_bold_style">Distance:</span>
                    </td>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_lblDistance"></span>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_Label11"
                        class="label_bold_style">Pay
                        Information:</span>
                    </td>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_lblPay"></span>
                    </td>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_Label6"
                        class="label_bold_style">End
                        Date:</span>
                    </td>
                    <td>
                        <span
                        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_lblEndDate"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl02_LinkButton1"
                        href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1$GridView1$ctl02$LinkButton1&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">View
                        Detail</a>
                    </td>
                    <td>
                        
                        
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
        
    </td>
</tr>
<tr>
    <td>
        
        <table
        class="style1">
        <tbody>
            <tr>
                <td
                width="15%">
                <span
                id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_Label1"
                class="label_bold_style">Position:</span>
            </td>
            <td
            width="45%">
            <span
            id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_lblTitle"
            class="label_bold_style">Medical
            Front
            Office</span>
        </td>
        <td
        width="15%">
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_Label4"
        class="label_bold_style">Category:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_lblCategory">Medical</span>
    </td>
</tr>
<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_Label8"
        class="label_bold_style">City:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_lblCity">Tulsa</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_LabelState"
        class="label_bold_style">State:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_lblState">OK</span>
    </td>
</tr>
<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_Label2"
        class="label_bold_style">Shift:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_lblShift">First
        Shift</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_Label10"
        class="label_bold_style">Distance:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_lblDistance"></span>
    </td>
</tr>

<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_Label11"
        class="label_bold_style">Pay
        Information:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_lblPay"></span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_Label6"
        class="label_bold_style">End
        Date:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_lblEndDate"></span>
    </td>
</tr>
<tr>
    <td>
        <a id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl03_LinkButton1"
        href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1$GridView1$ctl03$LinkButton1&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">View
        Detail</a>
    </td>
    <td>
        
        
    </td>
    <td>
        &nbsp;
    </td>
    <td>
        &nbsp;
    </td>
</tr>
</tbody>
</table>

</td>
</tr>
<tr>
    <td>
        
        <table
        class="style1">
        <tbody>
            <tr>
                <td
                width="15%">
                <span
                id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_Label1"
                class="label_bold_style">Position:</span>
            </td>
            <td
            width="45%">
            <span
            id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_lblTitle"
            class="label_bold_style">Medical
            Front
            Office</span>
        </td>
        <td
        width="15%">
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_Label4"
        class="label_bold_style">Category:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_lblCategory">Medical</span>
    </td>
</tr>
<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_Label8"
        class="label_bold_style">City:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_lblCity">Tulsa</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_LabelState"
        class="label_bold_style">State:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_lblState">OK</span>
    </td>
</tr>
<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_Label2"
        class="label_bold_style">Shift:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_lblShift">First
        Shift</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_Label10"
        class="label_bold_style">Distance:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_lblDistance"></span>
    </td>
</tr>

<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_Label11"
        class="label_bold_style">Pay
        Information:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_lblPay"></span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_Label6"
        class="label_bold_style">End
        Date:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_lblEndDate"></span>
    </td>
</tr>
<tr>
    <td>
        <a id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl04_LinkButton1"
        href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1$GridView1$ctl04$LinkButton1&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">View
        Detail</a>
    </td>
    <td>
        
        
    </td>
    <td>
        &nbsp;
    </td>
    <td>
        &nbsp;
    </td>
</tr>
</tbody>
</table>

</td>
</tr>
<tr>
    <td>
        
        <table
        class="style1">
        <tbody>
            <tr>
                <td
                width="15%">
                <span
                id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_Label1"
                class="label_bold_style">Position:</span>
            </td>
            <td
            width="45%">
            <span
            id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_lblTitle"
            class="label_bold_style">General
            Warehouse</span>
        </td>
        <td
        width="15%">
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_Label4"
        class="label_bold_style">Category:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_lblCategory">Warehouse</span>
    </td>
</tr>
<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_Label8"
        class="label_bold_style">City:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_lblCity">Tulsa</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_LabelState"
        class="label_bold_style">State:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_lblState">OK</span>
    </td>
</tr>
<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_Label2"
        class="label_bold_style">Shift:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_lblShift">1st</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_Label10"
        class="label_bold_style">Distance:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_lblDistance"></span>
    </td>
</tr>

<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_Label11"
        class="label_bold_style">Pay
        Information:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_lblPay">12.00</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_Label6"
        class="label_bold_style">End
        Date:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_lblEndDate"></span>
    </td>
</tr>
<tr>
    <td>
        <a id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl05_LinkButton1"
        href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1$GridView1$ctl05$LinkButton1&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">View
        Detail</a>
    </td>
    <td>
        
        
    </td>
    <td>
        &nbsp;
    </td>
    <td>
        &nbsp;
    </td>
</tr>
</tbody>
</table>

</td>
</tr>
<tr>
    <td>
        
        <table
        class="style1">
        <tbody>
            <tr>
                <td
                width="15%">
                <span
                id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_Label1"
                class="label_bold_style">Position:</span>
            </td>
            <td
            width="45%">
            <span
            id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_lblTitle"
            class="label_bold_style">Customer
            Service</span>
        </td>
        <td
        width="15%">
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_Label4"
        class="label_bold_style">Category:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_lblCategory">Clerical</span>
    </td>
</tr>
<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_Label8"
        class="label_bold_style">City:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_lblCity">Tulsa</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_LabelState"
        class="label_bold_style">State:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_lblState">OK</span>
    </td>
</tr>
<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_Label2"
        class="label_bold_style">Shift:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_lblShift">1st</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_Label10"
        class="label_bold_style">Distance:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_lblDistance"></span>
    </td>
</tr>

<tr>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_Label11"
        class="label_bold_style">Pay
        Information:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_lblPay">$13.00
        -
        $13.00</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_Label6"
        class="label_bold_style">End
        Date:</span>
    </td>
    <td>
        <span
        id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_lblEndDate"></span>
    </td>
</tr>
<tr>
    <td>
        <a id="ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1_GridView1_ctl06_LinkButton1"
        href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1$GridView1$ctl06$LinkButton1&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">View
        Detail</a>
    </td>
    <td>
        
        
    </td>
    <td>
        &nbsp;
    </td>
    <td>
        &nbsp;
    </td>
</tr>
</tbody>
</table>

</td>
</tr>
<tr>
    <td>
        <table>
            <tbody>
                <tr>
                    <td><span>1</span>
                    </td>
                    <td><a
                        href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1$GridView1&#39;,&#39;Page$2&#39;)">2</a>
                    </td>
                    <td><a
                        href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1$GridView1&#39;,&#39;Page$3&#39;)">3</a>
                    </td>
                    <td><a
                        href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1$GridView1&#39;,&#39;Page$4&#39;)">4</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>
</div>

</td>
</tr>

</tbody>
</table>
</div>
</div>
</div>
</td>
</tr>
</tbody>
</table>
<style type="text/css">
    .ctl00ContentPlaceHolder1JobListItem1WebPanel1ctl {
        width: 100%;
    }
</style>
</div>
<table class="style1">
    <tbody>
        <tr>
            <td>
                <input type="hidden"
                name="ctl00$ContentPlaceHolder1$JobListItem1$CategoryValue"
                id="ctl00_ContentPlaceHolder1_JobListItem1_CategoryValue"
                value="All">
            </td>
            <td>
                <input type="hidden"
                name="ctl00$ContentPlaceHolder1$JobListItem1$JobTitleValue"
                id="ctl00_ContentPlaceHolder1_JobListItem1_JobTitleValue"
                value="All">
            </td>
            <td>
                <input type="hidden"
                name="ctl00$ContentPlaceHolder1$JobListItem1$CityValue"
                id="ctl00_ContentPlaceHolder1_JobListItem1_CityValue"
                value="All">
            </td>
            <td>
                <input type="hidden"
                name="ctl00$ContentPlaceHolder1$JobListItem1$OrderTypeValue"
                id="ctl00_ContentPlaceHolder1_JobListItem1_OrderTypeValue"
                value="All">
            </td>
            <td>
                <input type="hidden"
                name="ctl00$ContentPlaceHolder1$JobListItem1$KeyWordValue"
                id="ctl00_ContentPlaceHolder1_JobListItem1_KeyWordValue">
            </td>
            <td>
                <input type="hidden"
                name="ctl00$ContentPlaceHolder1$JobListItem1$StateValue"
                id="ctl00_ContentPlaceHolder1_JobListItem1_StateValue"
                value="All">
            </td>
            <td>
                <input type="hidden"
                name="ctl00$ContentPlaceHolder1$JobListItem1$ZipCodeValue"
                id="ctl00_ContentPlaceHolder1_JobListItem1_ZipCodeValue">
            </td>
            <td>
                <input type="hidden"
                name="ctl00$ContentPlaceHolder1$JobListItem1$RadiusValue"
                id="ctl00_ContentPlaceHolder1_JobListItem1_RadiusValue"
                value="9999">
            </td>
        </tr>
    </tbody>
</table>
<input type="hidden"
name="ctl00$ContentPlaceHolder1$JobListItem1$HideColumnsValue"
id="ctl00_ContentPlaceHolder1_JobListItem1_HideColumnsValue"
value="pnlStartPostDates">
</div>


</div>
</td>
</tr>
</tbody>
</table>

</div>

</div>




</div>

</div>
</td>
</tr>
<tr>
    <td width="100%" valign="middle" align="center">
        <div id="miniFooter">
            <span id="ctl00_Label1" class="miniFooterFont"></span>
        </div>
    </td>
</tr>
</tbody>
</table>
</div>

<div id="footer">
    
    <div id="footer_right"><img src="https://hir.aviontego.com/Portals/ig_res/Caribbean/footer_right.jpg"
        id="ctl00_Img3" class="footer_rightImage">
        <br>
        <span id="ctl00_lblFooter">Copyright © 2014 HireCall, LLC<br><a href="http://www.hirecall.com/"
            target="_blank">http://www.hirecall.com/</a></span>
        </div>
        
    </div>
</div>
<input type="hidden" name="ctl00$_IG_CSS_LINKS_" id="ctl00__IG_CSS_LINKS_"
value="Style/HireCall_New_16_2.css|../../ig_res/Caribbean/ig_textedit.css|../../ig_res/Caribbean/ig_panel.css|../../ig_res/Caribbean/ig_shared.css">
<!-- <script type="text/javascript">
    //<![CDATA[
    var Page_ValidationSummaries = new Array(document.getElementById(
    "ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_ValidationSummary1"));
    var Page_Validators = new Array(document.getElementById(
    "ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_CustomValidator_ZipCode"));
    //]]>
</script>

<script type="text/javascript">
    //<![CDATA[
    var ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_CustomValidator_ZipCode = document.all ?
    document.all["ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_CustomValidator_ZipCode"] :
    document.getElementById(
    "ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_CustomValidator_ZipCode");
    ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_CustomValidator_ZipCode.evaluationfunction =
    "CustomValidatorEvaluateIsValid";
    //]]>
</script>

<script language="JavaScript">
    /* Google Tag Manager */
    (function (w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({
            'gtm.start': new Date().getTime(),
            event: 'gtm.js'
        });
        var f = d.getElementsByTagName(s)[0],
        j = d.createElement(s),
        dl = l != 'dataLayer' ? '&l=' + l : '';
        j.async = true;
        j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
        f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-NHTWFJN');
</script>
<script type="text/javascript">
    //<![CDATA[
    
    var Page_ValidationActive = false;
    if (typeof (ValidatorOnLoad) == "function") {
        ValidatorOnLoad();
    }
    
    function ValidatorOnSubmit() {
        if (Page_ValidationActive) {
            return ValidatorCommonOnSubmit();
        } else {
            return true;
        }
    }
    
    (function (id) {
        var e = document.getElementById(id);
        if (e) {
            e.dispose = function () {
                Array.remove(Page_ValidationSummaries, document.getElementById(id));
            }
            e = null;
        }
    })('ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_ValidationSummary1');
    //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
    try {
        igedit_init("ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_zipCodeTxt", 1,
        "ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1$zipCodeTxt,0 WebMaskEditKeyDown ,1,,,,0,1,1,,,0,1,,-1,",
        ["", "#####", "_  00"]);
    } catch (e) {
        window.status = "Can't init editor";
    }
    //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
    
    document.getElementById('ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_CustomValidator_ZipCode')
    .dispose = function () {
        Array.remove(Page_Validators, document.getElementById(
        'ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1_CustomValidator_ZipCode'));
    }
    //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
    var ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1_props = [
    "ctl00$ContentPlaceHolder1$JobBoardSearch1$WebPanel1",
    "ctl00_ContentPlaceHolder1_JobBoardSearch1_WebPanel1", true, true, 1, [
    ["", false],
    ["", false]
    ], "ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1pnl  igpnl_CaribbeanPanel", [
    "ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1hdrxpnd  ig_CaribbeanHeader igpnl_CaribbeanHeaderExpanded",
    "ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1hdrxpnd  ig_CaribbeanHeader igpnl_CaribbeanHeaderExpanded ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1hdrclps  ig_CaribbeanHeader igpnl_CaribbeanHeaderCollapsed",
    "ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1hdrhovr  ig_CaribbeanHeader igpnl_CaribbeanHeaderHover"
    ], '', '100%', false
    ];
    var ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1 = ig_CreateWebPanel(
    "ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1",
    ctl00ContentPlaceHolder1JobBoardSearch1WebPanel1_props);
    //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
    var ctl00ContentPlaceHolder1JobListItem1WebPanel1_props = [
    "ctl00$ContentPlaceHolder1$JobListItem1$WebPanel1",
    "ctl00_ContentPlaceHolder1_JobListItem1_WebPanel1", true, true, 1, [
    ["", false],
    ["", false]
    ], "ctl00ContentPlaceHolder1JobListItem1WebPanel1pnl  igpnl_CaribbeanPanel", [
    "ctl00ContentPlaceHolder1JobListItem1WebPanel1hdrxpnd webpanel_header_hide_style ig_CaribbeanHeader igpnl_CaribbeanHeaderExpanded",
    "ctl00ContentPlaceHolder1JobListItem1WebPanel1hdrxpnd webpanel_header_hide_style ig_CaribbeanHeader igpnl_CaribbeanHeaderExpanded ctl00ContentPlaceHolder1JobListItem1WebPanel1hdrclps  ig_CaribbeanHeader igpnl_CaribbeanHeaderCollapsed",
    "ctl00ContentPlaceHolder1JobListItem1WebPanel1hdrhovr  ig_CaribbeanHeader igpnl_CaribbeanHeaderHover"
    ], '', '100%', false
    ];
    var ctl00ContentPlaceHolder1JobListItem1WebPanel1 = ig_CreateWebPanel(
    "ctl00ContentPlaceHolder1JobListItem1WebPanel1",
    ctl00ContentPlaceHolder1JobListItem1WebPanel1_props);
    //]]>
</script> -->
</form>
</div>


<script>
    // Remove inline styles and attributes
    //https://gist.github.com/nathansmith/262366
    
    /*
    Remove inline style="..."
    Preserve hidden content.
    Call the function like this:
    var all = document.getElementsByTagName('*');
    remove_style(all);
    Note: Selecting all elements in the page via a
    wildcard query could be slow, depending on how
    many elements are in the page. You could use a
    smaller set of elements to be more performant:
    var set = document.getElementById('foo').getElementsByTagName('bar');
    remove_style(set);
    */
    
    function remove_style(list) {
        'use strict';
        
        // Presentational attributes.
        var attr = [
        'align',
        'background',
        'bgcolor',
        'border',
        'cellpadding',
        'cellspacing',
        'color',
        'face',
        'height',
        'hspace',
        'marginheight',
        'marginwidth',
        'noshade',
        'nowrap',
        'valign',
        'vspace',
        'width',
        'vlink',
        'alink',
        'text',
        'link',
        'frame',
        'frameborder',
        'clear',
        'scrolling',
        'style'
        ];
        
        // Used later.
        var attr_len = attr.length;
        var i = list.length;
        
        // Defined in loop.
        var j;
        var is_hidden;
        
        // Loop through node list.
        while (i--) {
            is_hidden = list[i].style.display === 'none';
            
            // Decrement `j` in next loop.
            j = attr_len;
            
            // Loop through attribute list.
            while (j--) {
                list[i].removeAttribute(attr[j]);
            }
            
            /*
            Re-hide display:none elements,
            so they can be toggled via JS.
            */
            if (is_hidden) {
                list[i].style.display = 'none';
            }
        }
    }
    
    var all = document.getElementsByTagName('*');
    remove_style(all);
</script>

<script type="text/javascript" src="https://hir.aviontego.com/portals/Scripts/UserControl/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="https://hir.aviontego.com/portals/Scripts/UserControl/jquery.browser.js"></script>
<script type="text/javascript" src="https://hir.aviontego.com/portals/Scripts/UserControl/jquery.cookie.js"></script>
<script type="text/javascript" src="https://hir.aviontego.com/portals/Scripts/UserControl/CheckBrowser.js"></script>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    
    <iframe name="_hjRemoteVarsFrame" title="_hjRemoteVarsFrame" id="_hjRemoteVarsFrame"
    src="https://hir.aviontego.com/portals/Scripts/UserControl/box-469cf41adb11dc78be68c1ae7f9457a4.html"
    style="display: none !important; width: 1px !important; height: 1px !important; opacity: 0 !important; pointer-events: none !important;"></iframe>
    
</body>
<div id="__genieContainer" style="all: initial;"></div>

</html>