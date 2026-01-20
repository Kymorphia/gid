/// Module for [Settings] class
module webkit.settings;

import gid.gid;
import glib.error;
import glib.key_file;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.feature;
import webkit.feature_list;
import webkit.types;

/**
    Control the behaviour of a #WebKitWebView.
    
    #WebKitSettings can be applied to a #WebKitWebView to control text charset,
    color, font sizes, printing mode, script support, loading of images and various
    other things on a #WebKitWebView. After creation, a #WebKitSettings object
    contains default settings.
    
    ```c
    // Disable JavaScript
    WebKitSettings *settings = webkit_web_view_group_get_settings (my_view_group);
    webkit_settings_set_enable_javascript (settings, FALSE);
    ```
*/
class Settings : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_settings_get_type != &gidSymbolNotFound ? webkit_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Settings self()
  {
    return this;
  }

  /**
      Get `allowFileAccessFromFileUrls` property.
      Returns: Whether file access is allowed from file URLs. By default, when
        something is loaded in a #WebKitWebView using a file URI, cross
        origin requests to other file resources are not allowed. This
        setting allows you to change that behaviour, so that it would be
        possible to do a XMLHttpRequest of a local file, for example.
  */
  @property bool allowFileAccessFromFileUrls()
  {
    return getAllowFileAccessFromFileUrls();
  }

  /**
      Set `allowFileAccessFromFileUrls` property.
      Params:
        propval = Whether file access is allowed from file URLs. By default, when
          something is loaded in a #WebKitWebView using a file URI, cross
          origin requests to other file resources are not allowed. This
          setting allows you to change that behaviour, so that it would be
          possible to do a XMLHttpRequest of a local file, for example.
  */
  @property void allowFileAccessFromFileUrls(bool propval)
  {
    return setAllowFileAccessFromFileUrls(propval);
  }

  /**
      Get `allowModalDialogs` property.
      Returns: Determine whether it's allowed to create and run modal dialogs
        from a #WebKitWebView through JavaScript with
        <function>window.showModalDialog</function>. If it's set to
        false, the associated #WebKitWebView won't be able to create
        new modal dialogs, so not even the #WebKitWebView::create
        signal will be emitted.
  */
  @property bool allowModalDialogs()
  {
    return getAllowModalDialogs();
  }

  /**
      Set `allowModalDialogs` property.
      Params:
        propval = Determine whether it's allowed to create and run modal dialogs
          from a #WebKitWebView through JavaScript with
          <function>window.showModalDialog</function>. If it's set to
          false, the associated #WebKitWebView won't be able to create
          new modal dialogs, so not even the #WebKitWebView::create
          signal will be emitted.
  */
  @property void allowModalDialogs(bool propval)
  {
    return setAllowModalDialogs(propval);
  }

  /**
      Get `allowTopNavigationToDataUrls` property.
      Returns: Whether or not the top frame is allowed to navigate to data URLs. It is disabled by default
        due to the risk it poses when loading untrusted URLs, with data URLs being used in scamming
        and phishing attacks. In contrast, a scenario where it could be enabled could be an app that
        embeds a WebView and you have control of the pages being show instead of a generic browser.
  */
  @property bool allowTopNavigationToDataUrls()
  {
    return getAllowTopNavigationToDataUrls();
  }

  /**
      Set `allowTopNavigationToDataUrls` property.
      Params:
        propval = Whether or not the top frame is allowed to navigate to data URLs. It is disabled by default
          due to the risk it poses when loading untrusted URLs, with data URLs being used in scamming
          and phishing attacks. In contrast, a scenario where it could be enabled could be an app that
          embeds a WebView and you have control of the pages being show instead of a generic browser.
  */
  @property void allowTopNavigationToDataUrls(bool propval)
  {
    return setAllowTopNavigationToDataUrls(propval);
  }

  /**
      Get `allowUniversalAccessFromFileUrls` property.
      Returns: Whether or not JavaScript running in the context of a file scheme URL
        should be allowed to access content from any origin.  By default, when
        something is loaded in a #WebKitWebView using a file scheme URL,
        access to the local file system and arbitrary local storage is not
        allowed. This setting allows you to change that behaviour, so that
        it would be possible to use local storage, for example.
  */
  @property bool allowUniversalAccessFromFileUrls()
  {
    return getAllowUniversalAccessFromFileUrls();
  }

  /**
      Set `allowUniversalAccessFromFileUrls` property.
      Params:
        propval = Whether or not JavaScript running in the context of a file scheme URL
          should be allowed to access content from any origin.  By default, when
          something is loaded in a #WebKitWebView using a file scheme URL,
          access to the local file system and arbitrary local storage is not
          allowed. This setting allows you to change that behaviour, so that
          it would be possible to use local storage, for example.
  */
  @property void allowUniversalAccessFromFileUrls(bool propval)
  {
    return setAllowUniversalAccessFromFileUrls(propval);
  }

  /**
      Get `autoLoadImages` property.
      Returns: Determines whether images should be automatically loaded or not.
        On devices where network bandwidth is of concern, it might be
        useful to turn this property off.
  */
  @property bool autoLoadImages()
  {
    return getAutoLoadImages();
  }

  /**
      Set `autoLoadImages` property.
      Params:
        propval = Determines whether images should be automatically loaded or not.
          On devices where network bandwidth is of concern, it might be
          useful to turn this property off.
  */
  @property void autoLoadImages(bool propval)
  {
    return setAutoLoadImages(propval);
  }

  /**
      Get `cursiveFontFamily` property.
      Returns: The font family used as the default for content using a cursive font.
  */
  @property string cursiveFontFamily()
  {
    return getCursiveFontFamily();
  }

  /**
      Set `cursiveFontFamily` property.
      Params:
        propval = The font family used as the default for content using a cursive font.
  */
  @property void cursiveFontFamily(string propval)
  {
    return setCursiveFontFamily(propval);
  }

  /**
      Get `defaultCharset` property.
      Returns: The default text charset used when interpreting content with an unspecified charset.
  */
  @property string defaultCharset()
  {
    return getDefaultCharset();
  }

  /**
      Set `defaultCharset` property.
      Params:
        propval = The default text charset used when interpreting content with an unspecified charset.
  */
  @property void defaultCharset(string propval)
  {
    return setDefaultCharset(propval);
  }

  /**
      Get `defaultFontFamily` property.
      Returns: The font family to use as the default for content that does not specify a font.
  */
  @property string defaultFontFamily()
  {
    return getDefaultFontFamily();
  }

  /**
      Set `defaultFontFamily` property.
      Params:
        propval = The font family to use as the default for content that does not specify a font.
  */
  @property void defaultFontFamily(string propval)
  {
    return setDefaultFontFamily(propval);
  }

  /**
      Get `defaultFontSize` property.
      Returns: The default font size in pixels to use for content displayed if
        no font size is specified.
  */
  @property uint defaultFontSize()
  {
    return getDefaultFontSize();
  }

  /**
      Set `defaultFontSize` property.
      Params:
        propval = The default font size in pixels to use for content displayed if
          no font size is specified.
  */
  @property void defaultFontSize(uint propval)
  {
    return setDefaultFontSize(propval);
  }

  /**
      Get `defaultMonospaceFontSize` property.
      Returns: The default font size in pixels to use for content displayed in
        monospace font if no font size is specified.
  */
  @property uint defaultMonospaceFontSize()
  {
    return getDefaultMonospaceFontSize();
  }

  /**
      Set `defaultMonospaceFontSize` property.
      Params:
        propval = The default font size in pixels to use for content displayed in
          monospace font if no font size is specified.
  */
  @property void defaultMonospaceFontSize(uint propval)
  {
    return setDefaultMonospaceFontSize(propval);
  }

  /**
      Get `disableWebSecurity` property.
      Returns: Enable or disable support for Web Security on pages.
        
        This setting disables the same-origin policy, allowing every website full control over
        all other websites. This is for use in special environments where you wish to disable
        all security and allow websites to hack each other. It is impossible to use this setting
        securely.
  */
  @property bool disableWebSecurity()
  {
    return getDisableWebSecurity();
  }

  /**
      Set `disableWebSecurity` property.
      Params:
        propval = Enable or disable support for Web Security on pages.
          
          This setting disables the same-origin policy, allowing every website full control over
          all other websites. This is for use in special environments where you wish to disable
          all security and allow websites to hack each other. It is impossible to use this setting
          securely.
  */
  @property void disableWebSecurity(bool propval)
  {
    return setDisableWebSecurity(propval);
  }

  /**
      Get `drawCompositingIndicators` property.
      Returns: Whether to draw compositing borders and repaint counters on layers drawn
        with accelerated compositing. This is useful for debugging issues related
        to web content that is composited with the GPU.
  */
  @property bool drawCompositingIndicators()
  {
    return getDrawCompositingIndicators();
  }

  /**
      Set `drawCompositingIndicators` property.
      Params:
        propval = Whether to draw compositing borders and repaint counters on layers drawn
          with accelerated compositing. This is useful for debugging issues related
          to web content that is composited with the GPU.
  */
  @property void drawCompositingIndicators(bool propval)
  {
    return setDrawCompositingIndicators(propval);
  }

  /**
      Get `enable2dCanvasAcceleration` property.
      Returns: Enable or disable 2D canvas acceleration.
        If this setting is enabled, the 2D canvas will be accelerated even if Skia CPU
        is used for rendering. However, the canvas can be unaccelerated even when this setting
        is enabled, for other reasons like its size or when willReadFrequently property is used.
  */
  @property bool enable2dCanvasAcceleration()
  {
    return getEnable2dCanvasAcceleration();
  }

  /**
      Set `enable2dCanvasAcceleration` property.
      Params:
        propval = Enable or disable 2D canvas acceleration.
          If this setting is enabled, the 2D canvas will be accelerated even if Skia CPU
          is used for rendering. However, the canvas can be unaccelerated even when this setting
          is enabled, for other reasons like its size or when willReadFrequently property is used.
  */
  @property void enable2dCanvasAcceleration(bool propval)
  {
    return setEnable2dCanvasAcceleration(propval);
  }

  /**
      Get `enableBackForwardNavigationGestures` property.
      Returns: Enable or disable horizontal swipe gesture for back-forward navigation.
  */
  @property bool enableBackForwardNavigationGestures()
  {
    return getEnableBackForwardNavigationGestures();
  }

  /**
      Set `enableBackForwardNavigationGestures` property.
      Params:
        propval = Enable or disable horizontal swipe gesture for back-forward navigation.
  */
  @property void enableBackForwardNavigationGestures(bool propval)
  {
    return setEnableBackForwardNavigationGestures(propval);
  }

  /**
      Get `enableCaretBrowsing` property.
      Returns: Whether to enable accessibility enhanced keyboard navigation.
  */
  @property bool enableCaretBrowsing()
  {
    return getEnableCaretBrowsing();
  }

  /**
      Set `enableCaretBrowsing` property.
      Params:
        propval = Whether to enable accessibility enhanced keyboard navigation.
  */
  @property void enableCaretBrowsing(bool propval)
  {
    return setEnableCaretBrowsing(propval);
  }

  /**
      Get `enableDeveloperExtras` property.
      Returns: Determines whether or not developer tools, such as the Web Inspector, are enabled.
  */
  @property bool enableDeveloperExtras()
  {
    return getEnableDeveloperExtras();
  }

  /**
      Set `enableDeveloperExtras` property.
      Params:
        propval = Determines whether or not developer tools, such as the Web Inspector, are enabled.
  */
  @property void enableDeveloperExtras(bool propval)
  {
    return setEnableDeveloperExtras(propval);
  }

  /**
      Get `enableDnsPrefetching` property.
      Returns: Determines whether or not to prefetch domain names. DNS prefetching attempts
        to resolve domain names before a user tries to follow a link.
  */
  @property bool enableDnsPrefetching()
  {
    return getEnableDnsPrefetching();
  }

  /**
      Set `enableDnsPrefetching` property.
      Params:
        propval = Determines whether or not to prefetch domain names. DNS prefetching attempts
          to resolve domain names before a user tries to follow a link.
  */
  @property void enableDnsPrefetching(bool propval)
  {
    return setEnableDnsPrefetching(propval);
  }

  /**
      Get `enableEncryptedMedia` property.
      Returns: Enable or disable support for Encrypted Media API on pages.
        EncryptedMedia is an experimental JavaScript API for playing encrypted media in HTML.
        This property will only work as intended if the EncryptedMedia feature is enabled at build time
        with the ENABLE_ENCRYPTED_MEDIA flag.
        
        See https://www.w3.org/TR/encrypted-media/
  */
  @property bool enableEncryptedMedia()
  {
    return getEnableEncryptedMedia();
  }

  /**
      Set `enableEncryptedMedia` property.
      Params:
        propval = Enable or disable support for Encrypted Media API on pages.
          EncryptedMedia is an experimental JavaScript API for playing encrypted media in HTML.
          This property will only work as intended if the EncryptedMedia feature is enabled at build time
          with the ENABLE_ENCRYPTED_MEDIA flag.
          
          See https://www.w3.org/TR/encrypted-media/
  */
  @property void enableEncryptedMedia(bool propval)
  {
    return setEnableEncryptedMedia(propval);
  }

  /**
      Get `enableFullscreen` property.
      Returns: Whether to enable the Javascript Fullscreen API. The API
        allows any HTML element to request fullscreen display. See also
        the current draft of the spec:
        http://www.w3.org/TR/fullscreen/
  */
  @property bool enableFullscreen()
  {
    return getEnableFullscreen();
  }

  /**
      Set `enableFullscreen` property.
      Params:
        propval = Whether to enable the Javascript Fullscreen API. The API
          allows any HTML element to request fullscreen display. See also
          the current draft of the spec:
          http://www.w3.org/TR/fullscreen/
  */
  @property void enableFullscreen(bool propval)
  {
    return setEnableFullscreen(propval);
  }

  /**
      Get `enableHtml5Database` property.
      Returns: Whether to enable HTML5 client-side SQL database support (IndexedDB).
  */
  @property bool enableHtml5Database()
  {
    return getEnableHtml5Database();
  }

  /**
      Set `enableHtml5Database` property.
      Params:
        propval = Whether to enable HTML5 client-side SQL database support (IndexedDB).
  */
  @property void enableHtml5Database(bool propval)
  {
    return setEnableHtml5Database(propval);
  }

  /**
      Get `enableHtml5LocalStorage` property.
      Returns: Whether to enable HTML5 local storage support. Local storage provides
        simple synchronous storage access.
        
        HTML5 local storage specification is available at
        http://dev.w3.org/html5/webstorage/.
  */
  @property bool enableHtml5LocalStorage()
  {
    return getEnableHtml5LocalStorage();
  }

  /**
      Set `enableHtml5LocalStorage` property.
      Params:
        propval = Whether to enable HTML5 local storage support. Local storage provides
          simple synchronous storage access.
          
          HTML5 local storage specification is available at
          http://dev.w3.org/html5/webstorage/.
  */
  @property void enableHtml5LocalStorage(bool propval)
  {
    return setEnableHtml5LocalStorage(propval);
  }

  /**
      Get `enableHyperlinkAuditing` property.
      Returns: Determines whether or not hyperlink auditing is enabled.
        
        The hyperlink auditing specification is available at
        http://www.whatwg.org/specs/web-apps/current-work/multipage/links.html#hyperlink-auditing.
  */
  @property bool enableHyperlinkAuditing()
  {
    return getEnableHyperlinkAuditing();
  }

  /**
      Set `enableHyperlinkAuditing` property.
      Params:
        propval = Determines whether or not hyperlink auditing is enabled.
          
          The hyperlink auditing specification is available at
          http://www.whatwg.org/specs/web-apps/current-work/multipage/links.html#hyperlink-auditing.
  */
  @property void enableHyperlinkAuditing(bool propval)
  {
    return setEnableHyperlinkAuditing(propval);
  }

  /**
      Get `enableJavascript` property.
      Returns: Determines whether or not JavaScript executes within a page.
  */
  @property bool enableJavascript()
  {
    return getEnableJavascript();
  }

  /**
      Set `enableJavascript` property.
      Params:
        propval = Determines whether or not JavaScript executes within a page.
  */
  @property void enableJavascript(bool propval)
  {
    return setEnableJavascript(propval);
  }

  /**
      Get `enableJavascriptMarkup` property.
      Returns: Determines whether or not JavaScript markup is allowed in document. When this setting is disabled,
        all JavaScript-related elements and attributes are removed from the document during parsing. Note that
        executing JavaScript is still allowed if #WebKitSettings:enable-javascript is true.
  */
  @property bool enableJavascriptMarkup()
  {
    return getEnableJavascriptMarkup();
  }

  /**
      Set `enableJavascriptMarkup` property.
      Params:
        propval = Determines whether or not JavaScript markup is allowed in document. When this setting is disabled,
          all JavaScript-related elements and attributes are removed from the document during parsing. Note that
          executing JavaScript is still allowed if #WebKitSettings:enable-javascript is true.
  */
  @property void enableJavascriptMarkup(bool propval)
  {
    return setEnableJavascriptMarkup(propval);
  }

  /**
      Get `enableMedia` property.
      Returns: Enable or disable support for media playback on pages. This setting is enabled by
        default. Disabling it means `<audio>`, `<track>` and `<video>` elements will have
        playback support disabled.
  */
  @property bool enableMedia()
  {
    return getEnableMedia();
  }

  /**
      Set `enableMedia` property.
      Params:
        propval = Enable or disable support for media playback on pages. This setting is enabled by
          default. Disabling it means `<audio>`, `<track>` and `<video>` elements will have
          playback support disabled.
  */
  @property void enableMedia(bool propval)
  {
    return setEnableMedia(propval);
  }

  /**
      Get `enableMediaCapabilities` property.
      Returns: Enable or disable support for MediaCapabilities on pages. This
        specification intends to provide APIs to allow websites to make an optimal
        decision when picking media content for the user. The APIs will expose
        information about the decoding and encoding capabilities for a given format
        but also output capabilities to find the best match based on the device’s
        display.
        
        See also https://wicg.github.io/media-capabilities/
  */
  @property bool enableMediaCapabilities()
  {
    return getEnableMediaCapabilities();
  }

  /**
      Set `enableMediaCapabilities` property.
      Params:
        propval = Enable or disable support for MediaCapabilities on pages. This
          specification intends to provide APIs to allow websites to make an optimal
          decision when picking media content for the user. The APIs will expose
          information about the decoding and encoding capabilities for a given format
          but also output capabilities to find the best match based on the device’s
          display.
          
          See also https://wicg.github.io/media-capabilities/
  */
  @property void enableMediaCapabilities(bool propval)
  {
    return setEnableMediaCapabilities(propval);
  }

  /**
      Get `enableMediaStream` property.
      Returns: Enable or disable support for MediaStream on pages. MediaStream
        is an experimental proposal for allowing web pages to access
        audio and video devices for capture.
        
        See also http://dev.w3.org/2011/webrtc/editor/getusermedia.html
  */
  @property bool enableMediaStream()
  {
    return getEnableMediaStream();
  }

  /**
      Set `enableMediaStream` property.
      Params:
        propval = Enable or disable support for MediaStream on pages. MediaStream
          is an experimental proposal for allowing web pages to access
          audio and video devices for capture.
          
          See also http://dev.w3.org/2011/webrtc/editor/getusermedia.html
  */
  @property void enableMediaStream(bool propval)
  {
    return setEnableMediaStream(propval);
  }

  /**
      Get `enableMediasource` property.
      Returns: Enable or disable support for MediaSource on pages. MediaSource
        extends HTMLMediaElement to allow JavaScript to generate media
        streams for playback.
        
        See also http://www.w3.org/TR/media-source/
  */
  @property bool enableMediasource()
  {
    return getEnableMediasource();
  }

  /**
      Set `enableMediasource` property.
      Params:
        propval = Enable or disable support for MediaSource on pages. MediaSource
          extends HTMLMediaElement to allow JavaScript to generate media
          streams for playback.
          
          See also http://www.w3.org/TR/media-source/
  */
  @property void enableMediasource(bool propval)
  {
    return setEnableMediasource(propval);
  }

  /**
      Get `enableMockCaptureDevices` property.
      Returns: Enable or disable the Mock Capture Devices. Those are fake
        Microphone and Camera devices to be used as MediaStream
        sources.
  */
  @property bool enableMockCaptureDevices()
  {
    return getEnableMockCaptureDevices();
  }

  /**
      Set `enableMockCaptureDevices` property.
      Params:
        propval = Enable or disable the Mock Capture Devices. Those are fake
          Microphone and Camera devices to be used as MediaStream
          sources.
  */
  @property void enableMockCaptureDevices(bool propval)
  {
    return setEnableMockCaptureDevices(propval);
  }

  /**
      Get `enableOfflineWebApplicationCache` property.
      Returns: Unsupported setting. This property does nothing.
  */
  @property bool enableOfflineWebApplicationCache()
  {
    return getEnableOfflineWebApplicationCache();
  }

  /**
      Set `enableOfflineWebApplicationCache` property.
      Params:
        propval = Unsupported setting. This property does nothing.
  */
  @property void enableOfflineWebApplicationCache(bool propval)
  {
    return setEnableOfflineWebApplicationCache(propval);
  }

  /**
      Get `enablePageCache` property.
      Returns: Enable or disable the page cache. Disabling the page cache is
        generally only useful for special circumstances like low-memory
        scenarios or special purpose applications like static HTML
        viewers. This setting only controls the Page Cache, this cache
        is different than the disk-based or memory-based traditional
        resource caches, its point is to make going back and forth
        between pages much faster. For details about the different types
        of caches and their purposes see:
        http://webkit.org/blog/427/webkit-page-cache-i-the-basics/
  */
  @property bool enablePageCache()
  {
    return getEnablePageCache();
  }

  /**
      Set `enablePageCache` property.
      Params:
        propval = Enable or disable the page cache. Disabling the page cache is
          generally only useful for special circumstances like low-memory
          scenarios or special purpose applications like static HTML
          viewers. This setting only controls the Page Cache, this cache
          is different than the disk-based or memory-based traditional
          resource caches, its point is to make going back and forth
          between pages much faster. For details about the different types
          of caches and their purposes see:
          http://webkit.org/blog/427/webkit-page-cache-i-the-basics/
  */
  @property void enablePageCache(bool propval)
  {
    return setEnablePageCache(propval);
  }

  /**
      Get `enableResizableTextAreas` property.
      Returns: Determines whether or not text areas can be resized.
  */
  @property bool enableResizableTextAreas()
  {
    return getEnableResizableTextAreas();
  }

  /**
      Set `enableResizableTextAreas` property.
      Params:
        propval = Determines whether or not text areas can be resized.
  */
  @property void enableResizableTextAreas(bool propval)
  {
    return setEnableResizableTextAreas(propval);
  }

  /**
      Get `enableSiteSpecificQuirks` property.
      Returns: Whether to turn on site-specific quirks. Turning this on will
        tell WebKit to use some site-specific workarounds for
        better web compatibility. For example, older versions of
        MediaWiki will incorrectly send to WebKit a CSS file with KHTML
        workarounds. By turning on site-specific quirks, WebKit will
        special-case this and other cases to make some specific sites work.
  */
  @property bool enableSiteSpecificQuirks()
  {
    return getEnableSiteSpecificQuirks();
  }

  /**
      Set `enableSiteSpecificQuirks` property.
      Params:
        propval = Whether to turn on site-specific quirks. Turning this on will
          tell WebKit to use some site-specific workarounds for
          better web compatibility. For example, older versions of
          MediaWiki will incorrectly send to WebKit a CSS file with KHTML
          workarounds. By turning on site-specific quirks, WebKit will
          special-case this and other cases to make some specific sites work.
  */
  @property void enableSiteSpecificQuirks(bool propval)
  {
    return setEnableSiteSpecificQuirks(propval);
  }

  /**
      Get `enableSmoothScrolling` property.
      Returns: Enable or disable smooth scrolling.
  */
  @property bool enableSmoothScrolling()
  {
    return getEnableSmoothScrolling();
  }

  /**
      Set `enableSmoothScrolling` property.
      Params:
        propval = Enable or disable smooth scrolling.
  */
  @property void enableSmoothScrolling(bool propval)
  {
    return setEnableSmoothScrolling(propval);
  }

  /**
      Get `enableSpatialNavigation` property.
      Returns: Whether to enable Spatial Navigation. This feature consists in the ability
        to navigate between focusable elements in a Web page, such as hyperlinks
        and form controls, by using Left, Right, Up and Down arrow keys.
        For example, if an user presses the Right key, heuristics determine whether
        there is an element they might be trying to reach towards the right, and if
        there are multiple elements, which element they probably wants.
  */
  @property bool enableSpatialNavigation()
  {
    return getEnableSpatialNavigation();
  }

  /**
      Set `enableSpatialNavigation` property.
      Params:
        propval = Whether to enable Spatial Navigation. This feature consists in the ability
          to navigate between focusable elements in a Web page, such as hyperlinks
          and form controls, by using Left, Right, Up and Down arrow keys.
          For example, if an user presses the Right key, heuristics determine whether
          there is an element they might be trying to reach towards the right, and if
          there are multiple elements, which element they probably wants.
  */
  @property void enableSpatialNavigation(bool propval)
  {
    return setEnableSpatialNavigation(propval);
  }

  /**
      Get `enableTabsToLinks` property.
      Returns: Determines whether the tab key cycles through the elements on the page.
        When this setting is enabled, users will be able to focus the next element
        in the page by pressing the tab key. If the selected element is editable,
        then pressing tab key will insert the tab character.
  */
  @property bool enableTabsToLinks()
  {
    return getEnableTabsToLinks();
  }

  /**
      Set `enableTabsToLinks` property.
      Params:
        propval = Determines whether the tab key cycles through the elements on the page.
          When this setting is enabled, users will be able to focus the next element
          in the page by pressing the tab key. If the selected element is editable,
          then pressing tab key will insert the tab character.
  */
  @property void enableTabsToLinks(bool propval)
  {
    return setEnableTabsToLinks(propval);
  }

  /**
      Get `enableWebaudio` property.
      Returns: Enable or disable support for WebAudio on pages. WebAudio is an
        API for processing and synthesizing audio in web applications
        
        See also https://webaudio.github.io/web-audio-api
  */
  @property bool enableWebaudio()
  {
    return getEnableWebaudio();
  }

  /**
      Set `enableWebaudio` property.
      Params:
        propval = Enable or disable support for WebAudio on pages. WebAudio is an
          API for processing and synthesizing audio in web applications
          
          See also https://webaudio.github.io/web-audio-api
  */
  @property void enableWebaudio(bool propval)
  {
    return setEnableWebaudio(propval);
  }

  /**
      Get `enableWebgl` property.
      Returns: Enable or disable support for WebGL on pages. WebGL enables web
        content to use an API based on OpenGL ES 2.0.
  */
  @property bool enableWebgl()
  {
    return getEnableWebgl();
  }

  /**
      Set `enableWebgl` property.
      Params:
        propval = Enable or disable support for WebGL on pages. WebGL enables web
          content to use an API based on OpenGL ES 2.0.
  */
  @property void enableWebgl(bool propval)
  {
    return setEnableWebgl(propval);
  }

  /**
      Get `enableWebrtc` property.
      Returns: Enable WebRTC support for loaded pages.
        
        Enabling this setting implies that `property@Settings:enable-media-stream`
        will be enabled as well.
        
        See also https://www.w3.org/TR/webrtc/
  */
  @property bool enableWebrtc()
  {
    return getEnableWebrtc();
  }

  /**
      Set `enableWebrtc` property.
      Params:
        propval = Enable WebRTC support for loaded pages.
          
          Enabling this setting implies that `property@Settings:enable-media-stream`
          will be enabled as well.
          
          See also https://www.w3.org/TR/webrtc/
  */
  @property void enableWebrtc(bool propval)
  {
    return setEnableWebrtc(propval);
  }

  /**
      Get `enableWriteConsoleMessagesToStdout` property.
      Returns: Enable or disable writing console messages to stdout. These are messages
        sent to the console with console.log and related methods.
  */
  @property bool enableWriteConsoleMessagesToStdout()
  {
    return getEnableWriteConsoleMessagesToStdout();
  }

  /**
      Set `enableWriteConsoleMessagesToStdout` property.
      Params:
        propval = Enable or disable writing console messages to stdout. These are messages
          sent to the console with console.log and related methods.
  */
  @property void enableWriteConsoleMessagesToStdout(bool propval)
  {
    return setEnableWriteConsoleMessagesToStdout(propval);
  }

  /**
      Get `fantasyFontFamily` property.
      Returns: The font family used as the default for content using a fantasy font.
  */
  @property string fantasyFontFamily()
  {
    return getFantasyFontFamily();
  }

  /**
      Set `fantasyFontFamily` property.
      Params:
        propval = The font family used as the default for content using a fantasy font.
  */
  @property void fantasyFontFamily(string propval)
  {
    return setFantasyFontFamily(propval);
  }

  /**
      Get `hardwareAccelerationPolicy` property.
      Returns: The #WebKitHardwareAccelerationPolicy to decide how to enable and disable
        hardware acceleration. Disabling hardware acceleration might
        cause some websites to not render correctly or consume more CPU.
        
        Note that changing this setting might not be possible if hardware acceleration is not
        supported by the hardware or the system. In that case, you can get the value to know the
        actual policy being used, but changing the setting will not have any effect.
  */
  @property webkit.types.HardwareAccelerationPolicy hardwareAccelerationPolicy()
  {
    return getHardwareAccelerationPolicy();
  }

  /**
      Set `hardwareAccelerationPolicy` property.
      Params:
        propval = The #WebKitHardwareAccelerationPolicy to decide how to enable and disable
          hardware acceleration. Disabling hardware acceleration might
          cause some websites to not render correctly or consume more CPU.
          
          Note that changing this setting might not be possible if hardware acceleration is not
          supported by the hardware or the system. In that case, you can get the value to know the
          actual policy being used, but changing the setting will not have any effect.
  */
  @property void hardwareAccelerationPolicy(webkit.types.HardwareAccelerationPolicy propval)
  {
    return setHardwareAccelerationPolicy(propval);
  }

  /**
      Get `javascriptCanAccessClipboard` property.
      Returns: Whether JavaScript can access the clipboard. The default value is false. If
        set to true, document.execCommand() allows cut, copy and paste commands.
  */
  @property bool javascriptCanAccessClipboard()
  {
    return getJavascriptCanAccessClipboard();
  }

  /**
      Set `javascriptCanAccessClipboard` property.
      Params:
        propval = Whether JavaScript can access the clipboard. The default value is false. If
          set to true, document.execCommand() allows cut, copy and paste commands.
  */
  @property void javascriptCanAccessClipboard(bool propval)
  {
    return setJavascriptCanAccessClipboard(propval);
  }

  /**
      Get `javascriptCanOpenWindowsAutomatically` property.
      Returns: Whether JavaScript can open popup windows automatically without user
        intervention.
  */
  @property bool javascriptCanOpenWindowsAutomatically()
  {
    return getJavascriptCanOpenWindowsAutomatically();
  }

  /**
      Set `javascriptCanOpenWindowsAutomatically` property.
      Params:
        propval = Whether JavaScript can open popup windows automatically without user
          intervention.
  */
  @property void javascriptCanOpenWindowsAutomatically(bool propval)
  {
    return setJavascriptCanOpenWindowsAutomatically(propval);
  }

  /**
      Get `loadIconsIgnoringImageLoadSetting` property.
      Returns: Unsupported setting. This property does nothing.
  */
  @property bool loadIconsIgnoringImageLoadSetting()
  {
    return getLoadIconsIgnoringImageLoadSetting();
  }

  /**
      Set `loadIconsIgnoringImageLoadSetting` property.
      Params:
        propval = Unsupported setting. This property does nothing.
  */
  @property void loadIconsIgnoringImageLoadSetting(bool propval)
  {
    return setLoadIconsIgnoringImageLoadSetting(propval);
  }

  /**
      Get `mediaContentTypesRequiringHardwareSupport` property.
      Returns: List of media content types requiring hardware support, split by semicolons (:).
        For example: 'video/webm; codecs="vp*":video/mp4; codecs="avc*":video/&ast; codecs="av1*"'.
  */
  @property string mediaContentTypesRequiringHardwareSupport()
  {
    return getMediaContentTypesRequiringHardwareSupport();
  }

  /**
      Set `mediaContentTypesRequiringHardwareSupport` property.
      Params:
        propval = List of media content types requiring hardware support, split by semicolons (:).
          For example: 'video/webm; codecs="vp*":video/mp4; codecs="avc*":video/&ast; codecs="av1*"'.
  */
  @property void mediaContentTypesRequiringHardwareSupport(string propval)
  {
    return setMediaContentTypesRequiringHardwareSupport(propval);
  }

  /**
      Get `mediaPlaybackAllowsInline` property.
      Returns: Whether media playback is full-screen only or inline playback is allowed.
        This is true by default, so media playback can be inline. Setting it to
        false allows specifying that media playback should be always fullscreen.
  */
  @property bool mediaPlaybackAllowsInline()
  {
    return getMediaPlaybackAllowsInline();
  }

  /**
      Set `mediaPlaybackAllowsInline` property.
      Params:
        propval = Whether media playback is full-screen only or inline playback is allowed.
          This is true by default, so media playback can be inline. Setting it to
          false allows specifying that media playback should be always fullscreen.
  */
  @property void mediaPlaybackAllowsInline(bool propval)
  {
    return setMediaPlaybackAllowsInline(propval);
  }

  /**
      Get `mediaPlaybackRequiresUserGesture` property.
      Returns: Whether a user gesture (such as clicking the play button)
        would be required to start media playback or load media. This is off
        by default, so media playback could start automatically.
        Setting it on requires a gesture by the user to start playback, or to
        load the media.
  */
  @property bool mediaPlaybackRequiresUserGesture()
  {
    return getMediaPlaybackRequiresUserGesture();
  }

  /**
      Set `mediaPlaybackRequiresUserGesture` property.
      Params:
        propval = Whether a user gesture (such as clicking the play button)
          would be required to start media playback or load media. This is off
          by default, so media playback could start automatically.
          Setting it on requires a gesture by the user to start playback, or to
          load the media.
  */
  @property void mediaPlaybackRequiresUserGesture(bool propval)
  {
    return setMediaPlaybackRequiresUserGesture(propval);
  }

  /**
      Get `minimumFontSize` property.
      Returns: The minimum font size in pixels used to display text. This setting
        controls the absolute smallest size. Values other than 0 can
        potentially break page layouts.
  */
  @property uint minimumFontSize()
  {
    return getMinimumFontSize();
  }

  /**
      Set `minimumFontSize` property.
      Params:
        propval = The minimum font size in pixels used to display text. This setting
          controls the absolute smallest size. Values other than 0 can
          potentially break page layouts.
  */
  @property void minimumFontSize(uint propval)
  {
    return setMinimumFontSize(propval);
  }

  /**
      Get `monospaceFontFamily` property.
      Returns: The font family used as the default for content using a monospace font.
  */
  @property string monospaceFontFamily()
  {
    return getMonospaceFontFamily();
  }

  /**
      Set `monospaceFontFamily` property.
      Params:
        propval = The font family used as the default for content using a monospace font.
  */
  @property void monospaceFontFamily(string propval)
  {
    return setMonospaceFontFamily(propval);
  }

  /**
      Get `pictographFontFamily` property.
      Returns: The font family used as the default for content using a pictograph font.
  */
  @property string pictographFontFamily()
  {
    return getPictographFontFamily();
  }

  /**
      Set `pictographFontFamily` property.
      Params:
        propval = The font family used as the default for content using a pictograph font.
  */
  @property void pictographFontFamily(string propval)
  {
    return setPictographFontFamily(propval);
  }

  /**
      Get `printBackgrounds` property.
      Returns: Whether background images should be drawn during printing.
  */
  @property bool printBackgrounds()
  {
    return getPrintBackgrounds();
  }

  /**
      Set `printBackgrounds` property.
      Params:
        propval = Whether background images should be drawn during printing.
  */
  @property void printBackgrounds(bool propval)
  {
    return setPrintBackgrounds(propval);
  }

  /**
      Get `sansSerifFontFamily` property.
      Returns: The font family used as the default for content using a sans-serif font.
  */
  @property string sansSerifFontFamily()
  {
    return getSansSerifFontFamily();
  }

  /**
      Set `sansSerifFontFamily` property.
      Params:
        propval = The font family used as the default for content using a sans-serif font.
  */
  @property void sansSerifFontFamily(string propval)
  {
    return setSansSerifFontFamily(propval);
  }

  /**
      Get `serifFontFamily` property.
      Returns: The font family used as the default for content using a serif font.
  */
  @property string serifFontFamily()
  {
    return getSerifFontFamily();
  }

  /**
      Set `serifFontFamily` property.
      Params:
        propval = The font family used as the default for content using a serif font.
  */
  @property void serifFontFamily(string propval)
  {
    return setSerifFontFamily(propval);
  }

  /**
      Get `userAgent` property.
      Returns: The user-agent string used by WebKit. Unusual user-agent strings may cause web
        content to render incorrectly or fail to run, as many web pages are written to
        parse the user-agent strings of only the most popular browsers. Therefore, it's
        typically better to not completely override the standard user-agent, but to use
        [webkit.settings.Settings.setUserAgentWithApplicationDetails] instead.
        
        If this property is set to the empty string or null, it will revert to the standard
        user-agent.
  */
  @property string userAgent()
  {
    return getUserAgent();
  }

  /**
      Set `userAgent` property.
      Params:
        propval = The user-agent string used by WebKit. Unusual user-agent strings may cause web
          content to render incorrectly or fail to run, as many web pages are written to
          parse the user-agent strings of only the most popular browsers. Therefore, it's
          typically better to not completely override the standard user-agent, but to use
          [webkit.settings.Settings.setUserAgentWithApplicationDetails] instead.
          
          If this property is set to the empty string or null, it will revert to the standard
          user-agent.
  */
  @property void userAgent(string propval)
  {
    return setUserAgent(propval);
  }

  /**
      Get `webrtcUdpPortsRange` property.
      Returns: Allow customization of the WebRTC UDP ports range.
        
        In some constrained environments where a firewall blocks UDP network traffic excepted on a
        specific port range, this settings can be used to give hints to the WebRTC backend regarding
        which ports to allocate. The format is min-port:max-port, so for instance 20000:30000. The
        default empty string value means the OS will use no hints from the WebRTC backend. Using 0
        for one of the values is allowed and means the value is unspecified.
  */
  @property string webrtcUdpPortsRange()
  {
    return getWebrtcUdpPortsRange();
  }

  /**
      Set `webrtcUdpPortsRange` property.
      Params:
        propval = Allow customization of the WebRTC UDP ports range.
          
          In some constrained environments where a firewall blocks UDP network traffic excepted on a
          specific port range, this settings can be used to give hints to the WebRTC backend regarding
          which ports to allocate. The format is min-port:max-port, so for instance 20000:30000. The
          default empty string value means the OS will use no hints from the WebRTC backend. Using 0
          for one of the values is allowed and means the value is unspecified.
  */
  @property void webrtcUdpPortsRange(string propval)
  {
    return setWebrtcUdpPortsRange(propval);
  }

  /**
      Get `zoomTextOnly` property.
      Returns: Whether #WebKitWebView:zoom-level affects only the
        text of the page or all the contents. Other contents containing text
        like form controls will be also affected by zoom factor when
        this property is enabled.
  */
  @property bool zoomTextOnly()
  {
    return getZoomTextOnly();
  }

  /**
      Set `zoomTextOnly` property.
      Params:
        propval = Whether #WebKitWebView:zoom-level affects only the
          text of the page or all the contents. Other contents containing text
          like form controls will be also affected by zoom factor when
          this property is enabled.
  */
  @property void zoomTextOnly(bool propval)
  {
    return setZoomTextOnly(propval);
  }

  /**
      Creates a new #WebKitSettings instance with default values.
      
      It must be manually attached to a #WebKitWebView.
      See also [webkit.settings.Settings.newWithSettings].
      Returns: a new #WebKitSettings instance.
  */
  this()
  {
    WebKitSettings* _cretval;
    _cretval = webkit_settings_new();
    this(_cretval, Yes.Take);
  }

  /**
      Convert points to the equivalent value in pixels.
      
      Applications can use this function to convert font size values
      in points to font size values in pixels when setting the font size properties
      of #WebKitSettings.
  
      Params:
        points = the font size in points to convert to pixels
      Returns: the equivalent font size in pixels.
  */
  static uint fontSizeToPixels(uint points)
  {
    uint _retval;
    _retval = webkit_settings_font_size_to_pixels(points);
    return _retval;
  }

  /**
      Convert pixels to the equivalent value in points.
      
      Applications can use this function to convert font size values
      in pixels to font size values in points when getting the font size properties
      of #WebKitSettings.
  
      Params:
        pixels = the font size in pixels to convert to points
      Returns: the equivalent font size in points.
  */
  static uint fontSizeToPoints(uint pixels)
  {
    uint _retval;
    _retval = webkit_settings_font_size_to_points(pixels);
    return _retval;
  }

  /**
      Gets the list of all available WebKit features.
      
      Features can be toggled with [webkit.settings.Settings.setFeatureEnabled],
      and their current state determined with
      [webkit.settings.Settings.getFeatureEnabled].
      
      Note that most applications should use
      [webkit.settings.Settings.getDevelopmentFeatures] and
      [webkit.settings.Settings.getExperimentalFeatures] instead.
      Returns: List of all features.
  */
  static webkit.feature_list.FeatureList getAllFeatures()
  {
    WebKitFeatureList* _cretval;
    _cretval = webkit_settings_get_all_features();
    auto _retval = _cretval ? new webkit.feature_list.FeatureList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the list of available development WebKit features.
      
      The returned features are a subset of those returned by
      [webkit.settings.Settings.getAllFeatures], and includes those which
      web and WebKit developers might find useful, but in general should
      *not* be exposed to end users; see `enumFeatureStatus` for
      more details.
      Returns: List of development features.
  */
  static webkit.feature_list.FeatureList getDevelopmentFeatures()
  {
    WebKitFeatureList* _cretval;
    _cretval = webkit_settings_get_development_features();
    auto _retval = _cretval ? new webkit.feature_list.FeatureList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the list of available experimental WebKit features.
      
      The returned features are a subset of those returned by
      [webkit.settings.Settings.getAllFeatures], and includes those which
      certain applications may want to expose to end users; see
      `enumFeatureStatus` for more details.
      Returns: List of experimental features.
  */
  static webkit.feature_list.FeatureList getExperimentalFeatures()
  {
    WebKitFeatureList* _cretval;
    _cretval = webkit_settings_get_experimental_features();
    auto _retval = _cretval ? new webkit.feature_list.FeatureList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Reads the contents of the given group_name from the given key_file and apply the value of
      each key/value to the corresponding property on the settings.
      
      Value types have to match with the corresponding setting property type and the group keys have to
      match existing setting property names. If those conditions are not met, the function will return
      false.
      
      Supported value types are strings (unquoted), booleans (0, 1, true, false) and unsigned integers.
  
      Params:
        keyFile = a #GKeyFile
        groupName = Name of the group to read from key_file
      Returns: true if the settings were correctly applied or false on error.
      Throws: [ErrorWrap]
  */
  bool applyFromKeyFile(glib.key_file.KeyFile keyFile, string groupName)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)webkit_settings_apply_from_key_file(cast(WebKitSettings*)this._cPtr, keyFile ? cast(GKeyFile*)keyFile._cPtr(No.Dup) : null, _groupName, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Get the #WebKitSettings:allow-file-access-from-file-urls property.
      Returns: true If file access from file URLs is allowed or false otherwise.
  */
  bool getAllowFileAccessFromFileUrls()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_allow_file_access_from_file_urls(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:allow-modal-dialogs property.
      Returns: true if it's allowed to create and run modal dialogs or false otherwise.
  */
  bool getAllowModalDialogs()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_allow_modal_dialogs(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:allow-top-navigation-to-data-urls property.
      Returns: true If navigation to data URLs from the top frame is allowed or false\
        otherwise.
  */
  bool getAllowTopNavigationToDataUrls()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_allow_top_navigation_to_data_urls(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:allow-universal-access-from-file-urls property.
      Returns: true If universal access from file URLs is allowed or false otherwise.
  */
  bool getAllowUniversalAccessFromFileUrls()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_allow_universal_access_from_file_urls(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:auto-load-images property.
      Returns: true If auto loading of images is enabled or false otherwise.
  */
  bool getAutoLoadImages()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_auto_load_images(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:cursive-font-family property.
      Returns: The default font family used to display content marked with cursive font.
  */
  string getCursiveFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_cursive_font_family(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:default-charset property.
      Returns: Default charset.
  */
  string getDefaultCharset()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_default_charset(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:default-font-family property.
      Returns: The default font family used to display content that does not specify a font.
  */
  string getDefaultFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_default_font_family(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:default-font-size property.
      Returns: The default font size, in pixels.
  */
  uint getDefaultFontSize()
  {
    uint _retval;
    _retval = webkit_settings_get_default_font_size(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:default-monospace-font-size property.
      Returns: Default monospace font size, in pixels.
  */
  uint getDefaultMonospaceFontSize()
  {
    uint _retval;
    _retval = webkit_settings_get_default_monospace_font_size(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:disable-web-security property.
      Returns: true If web security support is disabled or false otherwise.
  */
  bool getDisableWebSecurity()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_disable_web_security(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:draw-compositing-indicators property.
      Returns: true If compositing borders are drawn or false otherwise.
  */
  bool getDrawCompositingIndicators()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_draw_compositing_indicators(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-2d-canvas-acceleration property.
      Returns: true if 2D canvas acceleration is enabled or false otherwise.
  */
  bool getEnable2dCanvasAcceleration()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_2d_canvas_acceleration(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-back-forward-navigation-gestures property.
      Returns: true if horizontal swipe gesture will trigger back-forward navigaiton or false otherwise.
  */
  bool getEnableBackForwardNavigationGestures()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_back_forward_navigation_gestures(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-caret-browsing property.
      Returns: true If caret browsing is enabled or false otherwise.
  */
  bool getEnableCaretBrowsing()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_caret_browsing(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-developer-extras property.
      Returns: true If developer extras is enabled or false otherwise.
  */
  bool getEnableDeveloperExtras()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_developer_extras(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-dns-prefetching property.
      Returns: true If DNS prefetching is enabled or false otherwise.
  */
  bool getEnableDnsPrefetching()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_dns_prefetching(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-encrypted-media property.
      Returns: true if EncryptedMedia support is enabled or false otherwise.
  */
  bool getEnableEncryptedMedia()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_encrypted_media(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-fullscreen property.
      Returns: true If fullscreen support is enabled or false otherwise.
  */
  bool getEnableFullscreen()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_fullscreen(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-html5-database property.
      Returns: true if IndexedDB support is enabled or false otherwise.
  */
  bool getEnableHtml5Database()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_html5_database(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-html5-local-storage property.
      Returns: true If HTML5 local storage support is enabled or false otherwise.
  */
  bool getEnableHtml5LocalStorage()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_html5_local_storage(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-hyperlink-auditing property.
      Returns: true If hyper link auditing is enabled or false otherwise.
  */
  bool getEnableHyperlinkAuditing()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_hyperlink_auditing(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-javascript property.
      Returns: true If JavaScript is enabled or false otherwise.
  */
  bool getEnableJavascript()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_javascript(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-javascript-markup property.
      Returns: true if JavaScript markup is enabled or false otherwise.
  */
  bool getEnableJavascriptMarkup()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_javascript_markup(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-media property.
      Returns: true if media support is enabled or false otherwise.
  */
  bool getEnableMedia()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_media(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-media-capabilities property.
      Returns: true if MediaCapabilities support is enabled or false otherwise.
  */
  bool getEnableMediaCapabilities()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_media_capabilities(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-media-stream property.
      Returns: true If mediastream support is enabled or false otherwise.
  */
  bool getEnableMediaStream()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_media_stream(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-mediasource property.
      Returns: true If MediaSource support is enabled or false otherwise.
  */
  bool getEnableMediasource()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_mediasource(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-mock-capture-devices property.
      Returns: true If mock capture devices is enabled or false otherwise.
  */
  bool getEnableMockCaptureDevices()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_mock_capture_devices(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-offline-web-application-cache property.
      Returns: false.
  */
  bool getEnableOfflineWebApplicationCache()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_offline_web_application_cache(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-page-cache property.
      Returns: true if page cache enabled or false otherwise.
  */
  bool getEnablePageCache()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_page_cache(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-resizable-text-areas property.
      Returns: true If text areas can be resized or false otherwise.
  */
  bool getEnableResizableTextAreas()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_resizable_text_areas(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-site-specific-quirks property.
      Returns: true if site specific quirks are enabled or false otherwise.
  */
  bool getEnableSiteSpecificQuirks()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_site_specific_quirks(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-smooth-scrolling property.
      Returns: true if smooth scrolling is enabled or false otherwise.
  */
  bool getEnableSmoothScrolling()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_smooth_scrolling(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-spatial-navigation property.
      Returns: true If HTML5 spatial navigation support is enabled or false otherwise.
  */
  bool getEnableSpatialNavigation()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_spatial_navigation(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-tabs-to-links property.
      Returns: true If tabs to link is enabled or false otherwise.
  */
  bool getEnableTabsToLinks()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_tabs_to_links(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-webaudio property.
      Returns: true If webaudio support is enabled or false otherwise.
  */
  bool getEnableWebaudio()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_webaudio(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-webgl property.
      Returns: true If WebGL support is enabled or false otherwise.
  */
  bool getEnableWebgl()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_webgl(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the `propertySettings:enable-webrtc` property.
      Returns: true If WebRTC support is enabled or false otherwise.
  */
  bool getEnableWebrtc()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_webrtc(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-write-console-messages-to-stdout property.
      Returns: true if writing console messages to stdout is enabled or false
        otherwise.
  */
  bool getEnableWriteConsoleMessagesToStdout()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_enable_write_console_messages_to_stdout(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:fantasy-font-family property.
      Returns: The default font family used to display content marked with fantasy font.
  */
  string getFantasyFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_fantasy_font_family(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether a feature is enabled.
  
      Params:
        feature = the feature to toggle.
      Returns: Whether the feature is enabled.
  */
  bool getFeatureEnabled(webkit.feature.Feature feature)
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_feature_enabled(cast(WebKitSettings*)this._cPtr, feature ? cast(WebKitFeature*)feature._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the #WebKitSettings:hardware-acceleration-policy property.
      Returns: a #WebKitHardwareAccelerationPolicy
  */
  webkit.types.HardwareAccelerationPolicy getHardwareAccelerationPolicy()
  {
    WebKitHardwareAccelerationPolicy _cretval;
    _cretval = webkit_settings_get_hardware_acceleration_policy(cast(WebKitSettings*)this._cPtr);
    webkit.types.HardwareAccelerationPolicy _retval = cast(webkit.types.HardwareAccelerationPolicy)_cretval;
    return _retval;
  }

  /**
      Get the #WebKitSettings:javascript-can-access-clipboard property.
      Returns: true If javascript-can-access-clipboard is enabled or false otherwise.
  */
  bool getJavascriptCanAccessClipboard()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_javascript_can_access_clipboard(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:javascript-can-open-windows-automatically property.
      Returns: true If JavaScript can open window automatically or false otherwise.
  */
  bool getJavascriptCanOpenWindowsAutomatically()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_javascript_can_open_windows_automatically(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Setting no longer supported. This function returns false.
      Returns: false
  */
  bool getLoadIconsIgnoringImageLoadSetting()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_load_icons_ignoring_image_load_setting(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:media-content-types-requiring-hardware-support property.
      Returns: Media content types requiring hardware support, or null.
  */
  string getMediaContentTypesRequiringHardwareSupport()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_media_content_types_requiring_hardware_support(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitSettings:media-playback-allows-inline property.
      Returns: true If inline playback is allowed for media
           or false if only fullscreen playback is allowed.
  */
  bool getMediaPlaybackAllowsInline()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_media_playback_allows_inline(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:media-playback-requires-user-gesture property.
      Returns: true If an user gesture is needed to play or load media
           or false if no user gesture is needed.
  */
  bool getMediaPlaybackRequiresUserGesture()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_media_playback_requires_user_gesture(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:minimum-font-size property.
      Returns: Minimum font size, in pixels.
  */
  uint getMinimumFontSize()
  {
    uint _retval;
    _retval = webkit_settings_get_minimum_font_size(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:monospace-font-family property.
      Returns: Default font family used to display content marked with monospace font.
  */
  string getMonospaceFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_monospace_font_family(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:pictograph-font-family property.
      Returns: The default font family used to display content marked with pictograph font.
  */
  string getPictographFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_pictograph_font_family(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitSettings:print-backgrounds property.
      Returns: true If background images should be printed or false otherwise.
  */
  bool getPrintBackgrounds()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_print_backgrounds(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:sans-serif-font-family property.
      Returns: The default font family used to display content marked with sans-serif font.
  */
  string getSansSerifFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_sans_serif_font_family(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:serif-font-family property.
      Returns: The default font family used to display content marked with serif font.
  */
  string getSerifFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_serif_font_family(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitSettings:user-agent property.
      Returns: The current value of the user-agent property.
  */
  string getUserAgent()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_user_agent(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the `propertySettings:webrtc-udp-ports-range` property.
      Returns: The WebRTC UDP ports range, or null if un-set.
  */
  string getWebrtcUdpPortsRange()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_webrtc_udp_ports_range(cast(WebKitSettings*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitSettings:zoom-text-only property.
      Returns: true If zoom level of the view should only affect the text
           or false if all view contents should be scaled.
  */
  bool getZoomTextOnly()
  {
    bool _retval;
    _retval = cast(bool)webkit_settings_get_zoom_text_only(cast(WebKitSettings*)this._cPtr);
    return _retval;
  }

  /**
      Set the #WebKitSettings:allow-file-access-from-file-urls property.
  
      Params:
        allowed = Value to be set
  */
  void setAllowFileAccessFromFileUrls(bool allowed)
  {
    webkit_settings_set_allow_file_access_from_file_urls(cast(WebKitSettings*)this._cPtr, allowed);
  }

  /**
      Set the #WebKitSettings:allow-modal-dialogs property.
  
      Params:
        allowed = Value to be set
  */
  void setAllowModalDialogs(bool allowed)
  {
    webkit_settings_set_allow_modal_dialogs(cast(WebKitSettings*)this._cPtr, allowed);
  }

  /**
      Set the #WebKitSettings:allow-top-navigation-to-data-urls property.
  
      Params:
        allowed = Value to be set
  */
  void setAllowTopNavigationToDataUrls(bool allowed)
  {
    webkit_settings_set_allow_top_navigation_to_data_urls(cast(WebKitSettings*)this._cPtr, allowed);
  }

  /**
      Set the #WebKitSettings:allow-universal-access-from-file-urls property.
  
      Params:
        allowed = Value to be set
  */
  void setAllowUniversalAccessFromFileUrls(bool allowed)
  {
    webkit_settings_set_allow_universal_access_from_file_urls(cast(WebKitSettings*)this._cPtr, allowed);
  }

  /**
      Set the #WebKitSettings:auto-load-images property.
  
      Params:
        enabled = Value to be set
  */
  void setAutoLoadImages(bool enabled)
  {
    webkit_settings_set_auto_load_images(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:cursive-font-family property.
  
      Params:
        cursiveFontFamily = the new default cursive font family
  */
  void setCursiveFontFamily(string cursiveFontFamily)
  {
    const(char)* _cursiveFontFamily = cursiveFontFamily.toCString(No.Alloc);
    webkit_settings_set_cursive_font_family(cast(WebKitSettings*)this._cPtr, _cursiveFontFamily);
  }

  /**
      Set the #WebKitSettings:default-charset property.
  
      Params:
        defaultCharset = default charset to be set
  */
  void setDefaultCharset(string defaultCharset)
  {
    const(char)* _defaultCharset = defaultCharset.toCString(No.Alloc);
    webkit_settings_set_default_charset(cast(WebKitSettings*)this._cPtr, _defaultCharset);
  }

  /**
      Set the #WebKitSettings:default-font-family property.
  
      Params:
        defaultFontFamily = the new default font family
  */
  void setDefaultFontFamily(string defaultFontFamily)
  {
    const(char)* _defaultFontFamily = defaultFontFamily.toCString(No.Alloc);
    webkit_settings_set_default_font_family(cast(WebKitSettings*)this._cPtr, _defaultFontFamily);
  }

  /**
      Set the #WebKitSettings:default-font-size property.
  
      Params:
        fontSize = default font size to be set in pixels
  */
  void setDefaultFontSize(uint fontSize)
  {
    webkit_settings_set_default_font_size(cast(WebKitSettings*)this._cPtr, fontSize);
  }

  /**
      Set the #WebKitSettings:default-monospace-font-size property.
  
      Params:
        fontSize = default monospace font size to be set in pixels
  */
  void setDefaultMonospaceFontSize(uint fontSize)
  {
    webkit_settings_set_default_monospace_font_size(cast(WebKitSettings*)this._cPtr, fontSize);
  }

  /**
      Set the #WebKitSettings:disable-web-security property.
  
      Params:
        disabled = Value to be set
  */
  void setDisableWebSecurity(bool disabled)
  {
    webkit_settings_set_disable_web_security(cast(WebKitSettings*)this._cPtr, disabled);
  }

  /**
      Set the #WebKitSettings:draw-compositing-indicators property.
  
      Params:
        enabled = Value to be set
  */
  void setDrawCompositingIndicators(bool enabled)
  {
    webkit_settings_set_draw_compositing_indicators(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-2d-canvas-acceleration property.
  
      Params:
        enabled = Value to be set
  */
  void setEnable2dCanvasAcceleration(bool enabled)
  {
    webkit_settings_set_enable_2d_canvas_acceleration(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-back-forward-navigation-gestures property.
  
      Params:
        enabled = value to be set
  */
  void setEnableBackForwardNavigationGestures(bool enabled)
  {
    webkit_settings_set_enable_back_forward_navigation_gestures(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-caret-browsing property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableCaretBrowsing(bool enabled)
  {
    webkit_settings_set_enable_caret_browsing(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-developer-extras property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableDeveloperExtras(bool enabled)
  {
    webkit_settings_set_enable_developer_extras(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-dns-prefetching property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableDnsPrefetching(bool enabled)
  {
    webkit_settings_set_enable_dns_prefetching(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-encrypted-media property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableEncryptedMedia(bool enabled)
  {
    webkit_settings_set_enable_encrypted_media(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-fullscreen property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableFullscreen(bool enabled)
  {
    webkit_settings_set_enable_fullscreen(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-html5-database property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableHtml5Database(bool enabled)
  {
    webkit_settings_set_enable_html5_database(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-html5-local-storage property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableHtml5LocalStorage(bool enabled)
  {
    webkit_settings_set_enable_html5_local_storage(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-hyperlink-auditing property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableHyperlinkAuditing(bool enabled)
  {
    webkit_settings_set_enable_hyperlink_auditing(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-javascript property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableJavascript(bool enabled)
  {
    webkit_settings_set_enable_javascript(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-javascript-markup property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableJavascriptMarkup(bool enabled)
  {
    webkit_settings_set_enable_javascript_markup(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-media property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableMedia(bool enabled)
  {
    webkit_settings_set_enable_media(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-media-capabilities property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableMediaCapabilities(bool enabled)
  {
    webkit_settings_set_enable_media_capabilities(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-media-stream property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableMediaStream(bool enabled)
  {
    webkit_settings_set_enable_media_stream(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-mediasource property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableMediasource(bool enabled)
  {
    webkit_settings_set_enable_mediasource(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-mock-capture-devices property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableMockCaptureDevices(bool enabled)
  {
    webkit_settings_set_enable_mock_capture_devices(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Setting no longer supported. This function does nothing.
  
      Params:
        enabled = Value to be set
  */
  void setEnableOfflineWebApplicationCache(bool enabled)
  {
    webkit_settings_set_enable_offline_web_application_cache(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-page-cache property.
  
      Params:
        enabled = Value to be set
  */
  void setEnablePageCache(bool enabled)
  {
    webkit_settings_set_enable_page_cache(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-resizable-text-areas property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableResizableTextAreas(bool enabled)
  {
    webkit_settings_set_enable_resizable_text_areas(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-site-specific-quirks property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableSiteSpecificQuirks(bool enabled)
  {
    webkit_settings_set_enable_site_specific_quirks(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-smooth-scrolling property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableSmoothScrolling(bool enabled)
  {
    webkit_settings_set_enable_smooth_scrolling(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-spatial-navigation property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableSpatialNavigation(bool enabled)
  {
    webkit_settings_set_enable_spatial_navigation(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-tabs-to-links property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableTabsToLinks(bool enabled)
  {
    webkit_settings_set_enable_tabs_to_links(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-webaudio property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableWebaudio(bool enabled)
  {
    webkit_settings_set_enable_webaudio(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-webgl property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableWebgl(bool enabled)
  {
    webkit_settings_set_enable_webgl(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the `propertySettings:enable-webrtc` property.
      
      Setting this property to true implies the media-stream web-setting will also be enabled.
  
      Params:
        enabled = Value to be set
  */
  void setEnableWebrtc(bool enabled)
  {
    webkit_settings_set_enable_webrtc(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-write-console-messages-to-stdout property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableWriteConsoleMessagesToStdout(bool enabled)
  {
    webkit_settings_set_enable_write_console_messages_to_stdout(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:fantasy-font-family property.
  
      Params:
        fantasyFontFamily = the new default fantasy font family
  */
  void setFantasyFontFamily(string fantasyFontFamily)
  {
    const(char)* _fantasyFontFamily = fantasyFontFamily.toCString(No.Alloc);
    webkit_settings_set_fantasy_font_family(cast(WebKitSettings*)this._cPtr, _fantasyFontFamily);
  }

  /**
      Enables or disables a feature.
      
      The current status of the feature can be determined with
      `idwebkit_settings_get_feature_enabled`. To reset a feature to its
      initial status, pass the value returned by
      `idwebkit_feature_get_default_value` as the enabled parameter.
  
      Params:
        feature = the feature to toggle.
        enabled = whether the feature will be enabled.
  */
  void setFeatureEnabled(webkit.feature.Feature feature, bool enabled)
  {
    webkit_settings_set_feature_enabled(cast(WebKitSettings*)this._cPtr, feature ? cast(WebKitFeature*)feature._cPtr(No.Dup) : null, enabled);
  }

  /**
      Set the #WebKitSettings:hardware-acceleration-policy property.
  
      Params:
        policy = a #WebKitHardwareAccelerationPolicy
  */
  void setHardwareAccelerationPolicy(webkit.types.HardwareAccelerationPolicy policy)
  {
    webkit_settings_set_hardware_acceleration_policy(cast(WebKitSettings*)this._cPtr, policy);
  }

  /**
      Set the #WebKitSettings:javascript-can-access-clipboard property.
  
      Params:
        enabled = Value to be set
  */
  void setJavascriptCanAccessClipboard(bool enabled)
  {
    webkit_settings_set_javascript_can_access_clipboard(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:javascript-can-open-windows-automatically property.
  
      Params:
        enabled = Value to be set
  */
  void setJavascriptCanOpenWindowsAutomatically(bool enabled)
  {
    webkit_settings_set_javascript_can_open_windows_automatically(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Setting no longer supported. This function does nothing.
  
      Params:
        enabled = Value to be set
  */
  void setLoadIconsIgnoringImageLoadSetting(bool enabled)
  {
    webkit_settings_set_load_icons_ignoring_image_load_setting(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:media-content-types-requiring-hardware-support property.
  
      Params:
        contentTypes = list of media content types requiring hardware support split by semicolons (:) or null to use the default value.
  */
  void setMediaContentTypesRequiringHardwareSupport(string contentTypes = null)
  {
    const(char)* _contentTypes = contentTypes.toCString(No.Alloc);
    webkit_settings_set_media_content_types_requiring_hardware_support(cast(WebKitSettings*)this._cPtr, _contentTypes);
  }

  /**
      Set the #WebKitSettings:media-playback-allows-inline property.
  
      Params:
        enabled = Value to be set
  */
  void setMediaPlaybackAllowsInline(bool enabled)
  {
    webkit_settings_set_media_playback_allows_inline(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:media-playback-requires-user-gesture property.
  
      Params:
        enabled = Value to be set
  */
  void setMediaPlaybackRequiresUserGesture(bool enabled)
  {
    webkit_settings_set_media_playback_requires_user_gesture(cast(WebKitSettings*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:minimum-font-size property.
  
      Params:
        fontSize = minimum font size to be set in pixels
  */
  void setMinimumFontSize(uint fontSize)
  {
    webkit_settings_set_minimum_font_size(cast(WebKitSettings*)this._cPtr, fontSize);
  }

  /**
      Set the #WebKitSettings:monospace-font-family property.
  
      Params:
        monospaceFontFamily = the new default monospace font family
  */
  void setMonospaceFontFamily(string monospaceFontFamily)
  {
    const(char)* _monospaceFontFamily = monospaceFontFamily.toCString(No.Alloc);
    webkit_settings_set_monospace_font_family(cast(WebKitSettings*)this._cPtr, _monospaceFontFamily);
  }

  /**
      Set the #WebKitSettings:pictograph-font-family property.
  
      Params:
        pictographFontFamily = the new default pictograph font family
  */
  void setPictographFontFamily(string pictographFontFamily)
  {
    const(char)* _pictographFontFamily = pictographFontFamily.toCString(No.Alloc);
    webkit_settings_set_pictograph_font_family(cast(WebKitSettings*)this._cPtr, _pictographFontFamily);
  }

  /**
      Set the #WebKitSettings:print-backgrounds property.
  
      Params:
        printBackgrounds = Value to be set
  */
  void setPrintBackgrounds(bool printBackgrounds)
  {
    webkit_settings_set_print_backgrounds(cast(WebKitSettings*)this._cPtr, printBackgrounds);
  }

  /**
      Set the #WebKitSettings:sans-serif-font-family property.
  
      Params:
        sansSerifFontFamily = the new default sans-serif font family
  */
  void setSansSerifFontFamily(string sansSerifFontFamily)
  {
    const(char)* _sansSerifFontFamily = sansSerifFontFamily.toCString(No.Alloc);
    webkit_settings_set_sans_serif_font_family(cast(WebKitSettings*)this._cPtr, _sansSerifFontFamily);
  }

  /**
      Set the #WebKitSettings:serif-font-family property.
  
      Params:
        serifFontFamily = the new default serif font family
  */
  void setSerifFontFamily(string serifFontFamily)
  {
    const(char)* _serifFontFamily = serifFontFamily.toCString(No.Alloc);
    webkit_settings_set_serif_font_family(cast(WebKitSettings*)this._cPtr, _serifFontFamily);
  }

  /**
      Set the #WebKitSettings:user-agent property.
  
      Params:
        userAgent = The new custom user agent string or null to use the default user agent
  */
  void setUserAgent(string userAgent = null)
  {
    const(char)* _userAgent = userAgent.toCString(No.Alloc);
    webkit_settings_set_user_agent(cast(WebKitSettings*)this._cPtr, _userAgent);
  }

  /**
      Set the #WebKitSettings:user-agent property by appending the application details.
      
      Set the #WebKitSettings:user-agent property by appending the application details to the default user
      agent. If no application name or version is given, the default user agent used will be used. If only
      the version is given, the default engine version is used with the given application name.
  
      Params:
        applicationName = The application name used for the user agent or null to use the default user agent.
        applicationVersion = The application version for the user agent or null to user the default version.
  */
  void setUserAgentWithApplicationDetails(string applicationName = null, string applicationVersion = null)
  {
    const(char)* _applicationName = applicationName.toCString(No.Alloc);
    const(char)* _applicationVersion = applicationVersion.toCString(No.Alloc);
    webkit_settings_set_user_agent_with_application_details(cast(WebKitSettings*)this._cPtr, _applicationName, _applicationVersion);
  }

  /**
      Set the `propertySettings:webrtc-udp-ports-range` property.
  
      Params:
        udpPortRange = Value to be set
  */
  void setWebrtcUdpPortsRange(string udpPortRange)
  {
    const(char)* _udpPortRange = udpPortRange.toCString(No.Alloc);
    webkit_settings_set_webrtc_udp_ports_range(cast(WebKitSettings*)this._cPtr, _udpPortRange);
  }

  /**
      Set the #WebKitSettings:zoom-text-only property.
  
      Params:
        zoomTextOnly = Value to be set
  */
  void setZoomTextOnly(bool zoomTextOnly)
  {
    webkit_settings_set_zoom_text_only(cast(WebKitSettings*)this._cPtr, zoomTextOnly);
  }
}
