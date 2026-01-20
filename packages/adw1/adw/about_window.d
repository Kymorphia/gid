/// Module for [AboutWindow] class
module adw.about_window;

import adw.c.functions;
import adw.c.types;
import adw.types;
import adw.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;

/**
    A window showing information about the application.
    
    <picture>
      <source srcset="about-window-dark.png" media="(prefers-color-scheme: dark)">
      <img src="about-window.png" alt="about-window">
    </picture>
    
    An about window is typically opened when the user activates the `About …`
    item in the application's primary menu. All parts of the window are optional.
    
    ## Main page
    
    [adw.about_window.AboutWindow] prominently displays the application's icon, name, developer
    name and version. They can be set with the `property@AboutWindow:application-icon`,
    `property@AboutWindow:application-name`,
    `property@AboutWindow:developer-name` and `property@AboutWindow:version`
    respectively.
    
    ## What's New
    
    [adw.about_window.AboutWindow] provides a way for applications to display their release
    notes, set with the `property@AboutWindow:release-notes` property.
    
    Release notes are formatted the same way as
    [AppStream descriptions](https://freedesktop.org/software/appstream/docs/chap-Metadata.html#tag-description).
    
    The supported formatting options are:
    
    $(LIST
      * Paragraph (`<p>`)
      * Ordered list (`<ol>`), with list items (`<li>`)
      * Unordered list (`<ul>`), with list items (`<li>`)
    )
      
    Within paragraphs and list items, emphasis (`<em>`) and inline code
    (`<code>`) text styles are supported. The emphasis is rendered in italic,
    while inline code is shown in a monospaced font.
    
    Any text outside paragraphs or list items is ignored.
    
    Nested lists are not supported.
    
    Only one version can be shown at a time. By default, the displayed version
    number matches `property@AboutWindow:version`. Use
    `property@AboutWindow:release-notes-version` to override it.
    
    ## Details
    
    The Details page displays the application comments and links.
    
    The comments can be set with the `property@AboutWindow:comments` property.
    Unlike [gtk.about_dialog.AboutDialog.comments], this string can be long and
    detailed. It can also contain links and Pango markup.
    
    To set the application website, use `property@AboutWindow:website`.
    To add extra links below the website, use [adw.about_window.AboutWindow.addLink].
    
    If the Details page doesn't have any other content besides website, the
    website will be displayed on the main page instead.
    
    ## Troubleshooting
    
    [adw.about_window.AboutWindow] displays the following two links on the main page:
    
    $(LIST
      * Support Questions, set with the `property@AboutWindow:support-url` property,
      * Report an Issue, set with the `property@AboutWindow:issue-url` property.
    )
      
    Additionally, applications can provide debugging information. It will be
    shown separately on the Troubleshooting page. Use the
    `property@AboutWindow:debug-info` property to specify it.
    
    It's intended to be attached to issue reports when reporting issues against
    the application. As such, it cannot contain markup or links.
    
    [adw.about_window.AboutWindow] provides a quick way to save debug information to a file.
    When saving, `property@AboutWindow:debug-info-filename` would be used as
    the suggested filename.
    
    ## Credits and Acknowledgements
    
    The Credits page has the following default sections:
    
    $(LIST
      * Developers, set with the `property@AboutWindow:developers` property,
      * Designers, set with the `property@AboutWindow:designers` property,
      * Artists, set with the `property@AboutWindow:artists` property,
      * Documenters, set with the `property@AboutWindow:documenters` property,
      * Translators, set with the `property@AboutWindow:translator-credits` property.
    )
      
    When setting translator credits, use the strings `"translator-credits"` or
    `"translator_credits"` and mark them as translatable.
    
    The default sections that don't contain any names won't be displayed.
    
    The Credits page can also contain an arbitrary number of extra sections below
    the default ones. Use [adw.about_window.AboutWindow.addCreditSection] to add them.
    
    The Acknowledgements page can be used to acknowledge additional people and
    organizations for their non-development contributions. Use
    [adw.about_window.AboutWindow.addAcknowledgementSection] to add sections to it. For
    example, it can be used to list backers in a crowdfunded project or to give
    special thanks.
    
    Each of the people or organizations can have an email address or a website
    specified. To add a email address, use a string like
    `Edgar Allan Poe <edgar@poe.com>`. To specify a website with a title, use a
    string like `The GNOME Project https://www.gnome.org`:
    
    <picture>
      <source srcset="about-window-credits-dark.png" media="(prefers-color-scheme: dark)">
      <img src="about-window-credits.png" alt="about-window-credits">
    </picture>
    
    ## Legal
    
    The Legal page displays the copyright and licensing information for the
    application and other modules.
    
    The copyright string is set with the `property@AboutWindow:copyright`
    property and should be a short string of one or two lines, for example:
    `© 2022 Example`.
    
    Licensing information can be quickly set from a list of known licenses with
    the `property@AboutWindow:license-type` property. If the application's
    license is not in the list, `property@AboutWindow:license` can be used
    instead.
    
    To add information about other modules, such as application dependencies or
    data, use [adw.about_window.AboutWindow.addLegalSection].
    
    ## Constructing
    
    To make constructing an [adw.about_window.AboutWindow] as convenient as possible, you can
    use the function `func@show_about_window` which constructs and shows a
    window.
    
    ```c
    static void
    show_about (GtkApplication *app)
    {
      const char *developers[] = {
        "Angela Avery",
        NULL
      };
    
      const char *designers[] = {
        "GNOME Design Team",
        NULL
      };
    
      adw_show_about_window (gtk_application_get_active_window (app),
                             "application-name", _("Example"),
                             "application-icon", "org.example.App",
                             "version", "1.2.3",
                             "copyright", "© 2022 Angela Avery",
                             "issue-url", "https://gitlab.gnome.org/example/example/-/issues/new",
                             "license-type", GTK_LICENSE_GPL_3_0,
                             "developers", developers,
                             "designers", designers,
                             "translator-credits", _("translator-credits"),
                             NULL);
    }
    ```
    
    ## CSS nodes
    
    [adw.about_window.AboutWindow] has a main CSS node with the name `window` and the
    style class `.about`.
*/
class AboutWindow : adw.window.Window
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
    return cast(void function())adw_about_window_get_type != &gidSymbolNotFound ? adw_about_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AboutWindow self()
  {
    return this;
  }

  /**
      Get `applicationIcon` property.
      Returns: The name of the application icon.
        
        The icon is displayed at the top of the main page.
  */
  @property string applicationIcon()
  {
    return getApplicationIcon();
  }

  /**
      Set `applicationIcon` property.
      Params:
        propval = The name of the application icon.
          
          The icon is displayed at the top of the main page.
  */
  @property void applicationIcon(string propval)
  {
    return setApplicationIcon(propval);
  }

  /**
      Get `applicationName` property.
      Returns: The name of the application.
        
        The name is displayed at the top of the main page.
  */
  @property string applicationName()
  {
    return getApplicationName();
  }

  /**
      Set `applicationName` property.
      Params:
        propval = The name of the application.
          
          The name is displayed at the top of the main page.
  */
  @property void applicationName(string propval)
  {
    return setApplicationName(propval);
  }

  /**
      Get `comments` property.
      Returns: The comments about the application.
        
        Comments will be shown on the Details page, above links.
        
        Unlike [gtk.about_dialog.AboutDialog.comments], this string can be long and
        detailed. It can also contain links and Pango markup.
  */
  @property string comments()
  {
    return getComments();
  }

  /**
      Set `comments` property.
      Params:
        propval = The comments about the application.
          
          Comments will be shown on the Details page, above links.
          
          Unlike [gtk.about_dialog.AboutDialog.comments], this string can be long and
          detailed. It can also contain links and Pango markup.
  */
  @property void comments(string propval)
  {
    return setComments(propval);
  }

  /**
      Get `copyright` property.
      Returns: The copyright information.
        
        This should be a short string of one or two lines, for example:
        `© 2022 Example`.
        
        The copyright information will be displayed on the Legal page, above the
        application license.
        
        [adw.about_window.AboutWindow.addLegalSection] can be used to add copyright
        information for the application dependencies or other components.
  */
  @property string copyright()
  {
    return getCopyright();
  }

  /**
      Set `copyright` property.
      Params:
        propval = The copyright information.
          
          This should be a short string of one or two lines, for example:
          `© 2022 Example`.
          
          The copyright information will be displayed on the Legal page, above the
          application license.
          
          [adw.about_window.AboutWindow.addLegalSection] can be used to add copyright
          information for the application dependencies or other components.
  */
  @property void copyright(string propval)
  {
    return setCopyright(propval);
  }

  /**
      Get `debugInfo` property.
      Returns: The debug information.
        
        Debug information will be shown on the Troubleshooting page. It's intended
        to be attached to issue reports when reporting issues against the
        application.
        
        [adw.about_window.AboutWindow] provides a quick way to save debug information to a file.
        When saving, `property@AboutWindow:debug-info-filename` would be used as
        the suggested filename.
        
        Debug information cannot contain markup or links.
  */
  @property string debugInfo()
  {
    return getDebugInfo();
  }

  /**
      Set `debugInfo` property.
      Params:
        propval = The debug information.
          
          Debug information will be shown on the Troubleshooting page. It's intended
          to be attached to issue reports when reporting issues against the
          application.
          
          [adw.about_window.AboutWindow] provides a quick way to save debug information to a file.
          When saving, `property@AboutWindow:debug-info-filename` would be used as
          the suggested filename.
          
          Debug information cannot contain markup or links.
  */
  @property void debugInfo(string propval)
  {
    return setDebugInfo(propval);
  }

  /**
      Get `debugInfoFilename` property.
      Returns: The debug information filename.
        
        It will be used as the suggested filename when saving debug information to
        a file.
        
        See `property@AboutWindow:debug-info`.
  */
  @property string debugInfoFilename()
  {
    return getDebugInfoFilename();
  }

  /**
      Set `debugInfoFilename` property.
      Params:
        propval = The debug information filename.
          
          It will be used as the suggested filename when saving debug information to
          a file.
          
          See `property@AboutWindow:debug-info`.
  */
  @property void debugInfoFilename(string propval)
  {
    return setDebugInfoFilename(propval);
  }

  /**
      Get `developerName` property.
      Returns: The developer name.
        
        The developer name is displayed on the main page, under the application
        name.
        
        If the application is developed by multiple people, the developer name can
        be set to values like "AppName team", "AppName developers" or
        "The AppName project", and the individual contributors can be listed on the
        Credits page, with `property@AboutWindow:developers` and related
        properties.
  */
  @property string developerName()
  {
    return getDeveloperName();
  }

  /**
      Set `developerName` property.
      Params:
        propval = The developer name.
          
          The developer name is displayed on the main page, under the application
          name.
          
          If the application is developed by multiple people, the developer name can
          be set to values like "AppName team", "AppName developers" or
          "The AppName project", and the individual contributors can be listed on the
          Credits page, with `property@AboutWindow:developers` and related
          properties.
  */
  @property void developerName(string propval)
  {
    return setDeveloperName(propval);
  }

  /**
      Get `issueUrl` property.
      Returns: The URL for the application's issue tracker.
        
        The issue tracker link is displayed on the main page.
  */
  @property string issueUrl()
  {
    return getIssueUrl();
  }

  /**
      Set `issueUrl` property.
      Params:
        propval = The URL for the application's issue tracker.
          
          The issue tracker link is displayed on the main page.
  */
  @property void issueUrl(string propval)
  {
    return setIssueUrl(propval);
  }

  /**
      Get `license` property.
      Returns: The license text.
        
        This can be used to set a custom text for the license if it can't be set
        via `property@AboutWindow:license-type`.
        
        When set, `property@AboutWindow:license-type` will be set to
        [gtk.types.License.Custom].
        
        The license text will be displayed on the Legal page, below the copyright
        information.
        
        License text can contain Pango markup and links.
        
        [adw.about_window.AboutWindow.addLegalSection] can be used to add license
        information for the application dependencies or other components.
  */
  @property string license()
  {
    return getLicense();
  }

  /**
      Set `license` property.
      Params:
        propval = The license text.
          
          This can be used to set a custom text for the license if it can't be set
          via `property@AboutWindow:license-type`.
          
          When set, `property@AboutWindow:license-type` will be set to
          [gtk.types.License.Custom].
          
          The license text will be displayed on the Legal page, below the copyright
          information.
          
          License text can contain Pango markup and links.
          
          [adw.about_window.AboutWindow.addLegalSection] can be used to add license
          information for the application dependencies or other components.
  */
  @property void license(string propval)
  {
    return setLicense(propval);
  }

  /**
      Get `licenseType` property.
      Returns: The license type.
        
        Allows to set the application's license froma list of known licenses.
        
        If the application's license is not in the list,
        `property@AboutWindow:license` can be used instead. The license type will
        be automatically set to [gtk.types.License.Custom] in that case.
        
        If set to [gtk.types.License.Unknown], no information will be displayed.
        
        If the license type is different from [gtk.types.License.Custom].
        `property@AboutWindow:license` will be cleared out.
        
        The license description will be displayed on the Legal page, below the
        copyright information.
        
        [adw.about_window.AboutWindow.addLegalSection] can be used to add license
        information for the application dependencies or other components.
  */
  @property gtk.types.License licenseType()
  {
    return getLicenseType();
  }

  /**
      Set `licenseType` property.
      Params:
        propval = The license type.
          
          Allows to set the application's license froma list of known licenses.
          
          If the application's license is not in the list,
          `property@AboutWindow:license` can be used instead. The license type will
          be automatically set to [gtk.types.License.Custom] in that case.
          
          If set to [gtk.types.License.Unknown], no information will be displayed.
          
          If the license type is different from [gtk.types.License.Custom].
          `property@AboutWindow:license` will be cleared out.
          
          The license description will be displayed on the Legal page, below the
          copyright information.
          
          [adw.about_window.AboutWindow.addLegalSection] can be used to add license
          information for the application dependencies or other components.
  */
  @property void licenseType(gtk.types.License propval)
  {
    return setLicenseType(propval);
  }

  /**
      Get `releaseNotes` property.
      Returns: The release notes of the application.
        
        Release notes are displayed on the the What's New page.
        
        Release notes are formatted the same way as
        [AppStream descriptions](https://freedesktop.org/software/appstream/docs/chap-Metadata.html#tag-description).
        
        The supported formatting options are:
        
        $(LIST
          * Paragraph (`<p>`)
          * Ordered list (`<ol>`), with list items (`<li>`)
          * Unordered list (`<ul>`), with list items (`<li>`)
        )
          
        Within paragraphs and list items, emphasis (`<em>`) and inline code
        (`<code>`) text styles are supported. The emphasis is rendered in italic,
        while inline code is shown in a monospaced font.
        
        Any text outside paragraphs or list items is ignored.
        
        Nested lists are not supported.
        
        [adw.about_window.AboutWindow] displays the version above the release notes. If set, the
        `property@AboutWindow:release-notes-version` of the property will be used
        as the version; otherwise, `property@AboutWindow:version` is used.
  */
  @property string releaseNotes()
  {
    return getReleaseNotes();
  }

  /**
      Set `releaseNotes` property.
      Params:
        propval = The release notes of the application.
          
          Release notes are displayed on the the What's New page.
          
          Release notes are formatted the same way as
          [AppStream descriptions](https://freedesktop.org/software/appstream/docs/chap-Metadata.html#tag-description).
          
          The supported formatting options are:
          
          $(LIST
            * Paragraph (`<p>`)
            * Ordered list (`<ol>`), with list items (`<li>`)
            * Unordered list (`<ul>`), with list items (`<li>`)
          )
            
          Within paragraphs and list items, emphasis (`<em>`) and inline code
          (`<code>`) text styles are supported. The emphasis is rendered in italic,
          while inline code is shown in a monospaced font.
          
          Any text outside paragraphs or list items is ignored.
          
          Nested lists are not supported.
          
          [adw.about_window.AboutWindow] displays the version above the release notes. If set, the
          `property@AboutWindow:release-notes-version` of the property will be used
          as the version; otherwise, `property@AboutWindow:version` is used.
  */
  @property void releaseNotes(string propval)
  {
    return setReleaseNotes(propval);
  }

  /**
      Get `releaseNotesVersion` property.
      Returns: The version described by the application's release notes.
        
        The release notes version is displayed on the What's New page, above the
        release notes.
        
        If not set, `property@AboutWindow:version` will be used instead.
        
        For example, an application with the current version 2.0.2 might want to
        keep the release notes from 2.0.0, and set the release notes version
        accordingly.
        
        See `property@AboutWindow:release-notes`.
  */
  @property string releaseNotesVersion()
  {
    return getReleaseNotesVersion();
  }

  /**
      Set `releaseNotesVersion` property.
      Params:
        propval = The version described by the application's release notes.
          
          The release notes version is displayed on the What's New page, above the
          release notes.
          
          If not set, `property@AboutWindow:version` will be used instead.
          
          For example, an application with the current version 2.0.2 might want to
          keep the release notes from 2.0.0, and set the release notes version
          accordingly.
          
          See `property@AboutWindow:release-notes`.
  */
  @property void releaseNotesVersion(string propval)
  {
    return setReleaseNotesVersion(propval);
  }

  /**
      Get `supportUrl` property.
      Returns: The URL of the application's support page.
        
        The support page link is displayed on the main page.
  */
  @property string supportUrl()
  {
    return getSupportUrl();
  }

  /**
      Set `supportUrl` property.
      Params:
        propval = The URL of the application's support page.
          
          The support page link is displayed on the main page.
  */
  @property void supportUrl(string propval)
  {
    return setSupportUrl(propval);
  }

  /**
      Get `translatorCredits` property.
      Returns: The translator credits string.
        
        It will be displayed on the Credits page.
        
        This string should be `"translator-credits"` or `"translator_credits"` and
        should be marked as translatable.
        
        The string may contain email addresses and URLs, see the introduction for
        more details.
        
        See also:
        
        $(LIST
          * `property@AboutWindow:developers`
          * `property@AboutWindow:designers`
          * `property@AboutWindow:artists`
          * `property@AboutWindow:documenters`
          * [adw.about_window.AboutWindow.addCreditSection]
          * [adw.about_window.AboutWindow.addAcknowledgementSection]
        )
  */
  @property string translatorCredits()
  {
    return getTranslatorCredits();
  }

  /**
      Set `translatorCredits` property.
      Params:
        propval = The translator credits string.
          
          It will be displayed on the Credits page.
          
          This string should be `"translator-credits"` or `"translator_credits"` and
          should be marked as translatable.
          
          The string may contain email addresses and URLs, see the introduction for
          more details.
          
          See also:
          
          $(LIST
            * `property@AboutWindow:developers`
            * `property@AboutWindow:designers`
            * `property@AboutWindow:artists`
            * `property@AboutWindow:documenters`
            * [adw.about_window.AboutWindow.addCreditSection]
            * [adw.about_window.AboutWindow.addAcknowledgementSection]
          )
  */
  @property void translatorCredits(string propval)
  {
    return setTranslatorCredits(propval);
  }

  /**
      Get `version_` property.
      Returns: The version of the application.
        
        The version is displayed on the main page.
        
        If `property@AboutWindow:release-notes-version` is not set, the version
        will also be displayed above the release notes on the What's New page.
  */
  @property string version_()
  {
    return getVersion();
  }

  /**
      Set `version_` property.
      Params:
        propval = The version of the application.
          
          The version is displayed on the main page.
          
          If `property@AboutWindow:release-notes-version` is not set, the version
          will also be displayed above the release notes on the What's New page.
  */
  @property void version_(string propval)
  {
    return setVersion(propval);
  }

  /**
      Get `website` property.
      Returns: The URL of the application's website.
        
        Website is displayed on the Details page, below comments, or on the main
        page if the Details page doesn't have any other content.
        
        Applications can add other links below, see [adw.about_window.AboutWindow.addLink].
  */
  @property string website()
  {
    return getWebsite();
  }

  /**
      Set `website` property.
      Params:
        propval = The URL of the application's website.
          
          Website is displayed on the Details page, below comments, or on the main
          page if the Details page doesn't have any other content.
          
          Applications can add other links below, see [adw.about_window.AboutWindow.addLink].
  */
  @property void website(string propval)
  {
    return setWebsite(propval);
  }

  /**
      Creates a new [adw.about_window.AboutWindow].
      Returns: the newly created [adw.about_window.AboutWindow]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_about_window_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [adw.about_window.AboutWindow] using AppStream metadata.
      
      This automatically sets the following properties with the following AppStream
      values:
      
      $(LIST
        * `propertyAboutWindow:application-icon` is set from the `<id>`
        * `propertyAboutWindow:application-name` is set from the `<name>`
        * `propertyAboutWindow:developer-name` is set from the `<name>` within
             `<developer>`
        * `propertyAboutWindow:version` is set from the version of the latest release
        * `propertyAboutWindow:website` is set from the `<url type="homepage">`
        * `propertyAboutWindow:support-url` is set from the `<url type="help">`
        * `propertyAboutWindow:issue-url` is set from the `<url type="bugtracker">`
        * `propertyAboutWindow:license-type` is set from the `<project_license>`.
            If the license type retrieved from AppStream is not listed in
            [gtk.types.License], it will be set to `GTK_LICENCE_CUSTOM`.
      )
        
      If release_notes_version is not `NULL`,
      `propertyAboutWindow:release-notes-version` is set to match it, while
      `propertyAboutWindow:release-notes` is set from the AppStream release
      description for that version.
  
      Params:
        resourcePath = The resource to use
        releaseNotesVersion = The version to retrieve release notes for
      Returns: the newly created [adw.about_window.AboutWindow]
  */
  static adw.about_window.AboutWindow newFromAppdata(string resourcePath, string releaseNotesVersion = null)
  {
    GtkWidget* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    const(char)* _releaseNotesVersion = releaseNotesVersion.toCString(No.Alloc);
    _cretval = adw_about_window_new_from_appdata(_resourcePath, _releaseNotesVersion);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.about_window.AboutWindow)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a section to the Acknowledgements page.
      
      This can be used to acknowledge additional people and organizations for their
      non-development contributions - for example, backers in a crowdfunded
      project.
      
      Each name may contain email addresses and URLs, see the introduction for more
      details.
      
      See also:
      
      $(LIST
        * `propertyAboutWindow:developers`
        * `propertyAboutWindow:designers`
        * `propertyAboutWindow:artists`
        * `propertyAboutWindow:documenters`
        * `propertyAboutWindow:translator-credits`
        * [adw.about_window.AboutWindow.addCreditSection]
      )
  
      Params:
        name = the section name
        people = the list of names
  */
  void addAcknowledgementSection(string name, string[] people)
  {
    const(char)* _name = name.toCString(No.Alloc);
    char*[] _tmppeople;
    foreach (s; people)
      _tmppeople ~= s.toCString(No.Alloc);
    _tmppeople ~= null;
    const(char*)* _people = _tmppeople.ptr;

    adw_about_window_add_acknowledgement_section(cast(AdwAboutWindow*)this._cPtr, _name, _people);
  }

  /**
      Adds an extra section to the Credits page.
      
      Extra sections are displayed below the standard categories.
      
      Each name may contain email addresses and URLs, see the introduction for more
      details.
      
      See also:
      
      $(LIST
        * `propertyAboutWindow:developers`
        * `propertyAboutWindow:designers`
        * `propertyAboutWindow:artists`
        * `propertyAboutWindow:documenters`
        * `propertyAboutWindow:translator-credits`
        * [adw.about_window.AboutWindow.addAcknowledgementSection]
      )
  
      Params:
        name = the section name
        people = the list of names
  */
  void addCreditSection(string name, string[] people)
  {
    const(char)* _name = name.toCString(No.Alloc);
    char*[] _tmppeople;
    foreach (s; people)
      _tmppeople ~= s.toCString(No.Alloc);
    _tmppeople ~= null;
    const(char*)* _people = _tmppeople.ptr;

    adw_about_window_add_credit_section(cast(AdwAboutWindow*)this._cPtr, _name, _people);
  }

  /**
      Adds an extra section to the Legal page.
      
      Extra sections will be displayed below the application's own information.
      
      The parameters copyright, license_type and license will be used to present
      the it the same way as `propertyAboutWindow:copyright`,
      `propertyAboutWindow:license-type` and `propertyAboutWindow:license` are
      for the application's own information.
      
      See those properties for more details.
      
      This can be useful to attribute the application dependencies or data.
      
      Examples:
      
      ```c
      adw_about_window_add_legal_section (ADW_ABOUT_WINDOW (about),
                                          _("Copyright and a known license"),
                                          "© 2022 Example",
                                          GTK_LICENSE_LGPL_2_1,
                                          NULL);
      
      adw_about_window_add_legal_section (ADW_ABOUT_WINDOW (about),
                                          _("Copyright and custom license"),
                                          "© 2022 Example",
                                          GTK_LICENSE_CUSTOM,
                                          "Custom license text");
      
      adw_about_window_add_legal_section (ADW_ABOUT_WINDOW (about),
                                          _("Copyright only"),
                                          "© 2022 Example",
                                          GTK_LICENSE_UNKNOWN,
                                          NULL);
      
      adw_about_window_add_legal_section (ADW_ABOUT_WINDOW (about),
                                          _("Custom license only"),
                                          NULL,
                                          GTK_LICENSE_CUSTOM,
                                          "Something completely custom here.");
      ```
  
      Params:
        title = the name of the section
        copyright = a copyright string
        licenseType = the type of license
        license = custom license information
  */
  void addLegalSection(string title, string copyright, gtk.types.License licenseType, string license = null)
  {
    const(char)* _title = title.toCString(No.Alloc);
    const(char)* _copyright = copyright.toCString(No.Alloc);
    const(char)* _license = license.toCString(No.Alloc);
    adw_about_window_add_legal_section(cast(AdwAboutWindow*)this._cPtr, _title, _copyright, licenseType, _license);
  }

  /**
      Adds an extra link to the Details page.
      
      Extra links are displayed under the comment and website.
      
      Underlines in title will be interpreted as indicating a mnemonic.
      
      See `propertyAboutWindow:website`.
  
      Params:
        title = the link title
        url = the link URL
  */
  void addLink(string title, string url)
  {
    const(char)* _title = title.toCString(No.Alloc);
    const(char)* _url = url.toCString(No.Alloc);
    adw_about_window_add_link(cast(AdwAboutWindow*)this._cPtr, _title, _url);
  }

  /**
      Gets the name of the application icon for self.
      Returns: the application icon name
  */
  string getApplicationIcon()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_application_icon(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the application name for self.
      Returns: the application name
  */
  string getApplicationName()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_application_name(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the list of artists of the application.
      Returns: The list of artists
  */
  string[] getArtists()
  {
    const(char*)* _cretval;
    _cretval = adw_about_window_get_artists(cast(AdwAboutWindow*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Gets the comments about the application.
      Returns: the comments
  */
  string getComments()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_comments(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the copyright information for self.
      Returns: the copyright information
  */
  string getCopyright()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_copyright(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the debug information for self.
      Returns: the debug information
  */
  string getDebugInfo()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_debug_info(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the debug information filename for self.
      Returns: the debug information filename
  */
  string getDebugInfoFilename()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_debug_info_filename(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the list of designers of the application.
      Returns: The list of designers
  */
  string[] getDesigners()
  {
    const(char*)* _cretval;
    _cretval = adw_about_window_get_designers(cast(AdwAboutWindow*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Gets the developer name for self.
      Returns: the developer_name
  */
  string getDeveloperName()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_developer_name(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the list of developers of the application.
      Returns: The list of developers
  */
  string[] getDevelopers()
  {
    const(char*)* _cretval;
    _cretval = adw_about_window_get_developers(cast(AdwAboutWindow*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Gets the list of documenters of the application.
      Returns: The list of documenters
  */
  string[] getDocumenters()
  {
    const(char*)* _cretval;
    _cretval = adw_about_window_get_documenters(cast(AdwAboutWindow*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Gets the issue tracker URL for self.
      Returns: the issue tracker URL
  */
  string getIssueUrl()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_issue_url(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the license for self.
      Returns: the license
  */
  string getLicense()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_license(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the license type for self.
      Returns: the license type
  */
  gtk.types.License getLicenseType()
  {
    GtkLicense _cretval;
    _cretval = adw_about_window_get_license_type(cast(AdwAboutWindow*)this._cPtr);
    gtk.types.License _retval = cast(gtk.types.License)_cretval;
    return _retval;
  }

  /**
      Gets the release notes for self.
      Returns: the release notes
  */
  string getReleaseNotes()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_release_notes(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the version described by the application's release notes.
      Returns: the release notes version
  */
  string getReleaseNotesVersion()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_release_notes_version(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the URL of the support page for self.
      Returns: the support page URL
  */
  string getSupportUrl()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_support_url(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the translator credits string.
      Returns: The translator credits string
  */
  string getTranslatorCredits()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_translator_credits(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the version for self.
      Returns: the version
  */
  string getVersion()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_version(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the application website URL for self.
      Returns: the website URL
  */
  string getWebsite()
  {
    const(char)* _cretval;
    _cretval = adw_about_window_get_website(cast(AdwAboutWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the name of the application icon for self.
      
      The icon is displayed at the top of the main page.
  
      Params:
        applicationIcon = the application icon name
  */
  void setApplicationIcon(string applicationIcon)
  {
    const(char)* _applicationIcon = applicationIcon.toCString(No.Alloc);
    adw_about_window_set_application_icon(cast(AdwAboutWindow*)this._cPtr, _applicationIcon);
  }

  /**
      Sets the application name for self.
      
      The name is displayed at the top of the main page.
  
      Params:
        applicationName = the application name
  */
  void setApplicationName(string applicationName)
  {
    const(char)* _applicationName = applicationName.toCString(No.Alloc);
    adw_about_window_set_application_name(cast(AdwAboutWindow*)this._cPtr, _applicationName);
  }

  /**
      Sets the list of artists of the application.
      
      It will be displayed on the Credits page.
      
      Each name may contain email addresses and URLs, see the introduction for more
      details.
      
      See also:
      
      $(LIST
        * `propertyAboutWindow:developers`
        * `propertyAboutWindow:designers`
        * `propertyAboutWindow:documenters`
        * `propertyAboutWindow:translator-credits`
        * [adw.about_window.AboutWindow.addCreditSection]
        * [adw.about_window.AboutWindow.addAcknowledgementSection]
      )
  
      Params:
        artists = the list of artists
  */
  void setArtists(string[] artists = null)
  {
    char*[] _tmpartists;
    foreach (s; artists)
      _tmpartists ~= s.toCString(No.Alloc);
    _tmpartists ~= null;
    const(char*)* _artists = _tmpartists.ptr;

    adw_about_window_set_artists(cast(AdwAboutWindow*)this._cPtr, _artists);
  }

  /**
      Sets the comments about the application.
      
      Comments will be shown on the Details page, above links.
      
      Unlike [gtk.about_dialog.AboutDialog.comments], this string can be long and
      detailed. It can also contain links and Pango markup.
  
      Params:
        comments = the comments
  */
  void setComments(string comments)
  {
    const(char)* _comments = comments.toCString(No.Alloc);
    adw_about_window_set_comments(cast(AdwAboutWindow*)this._cPtr, _comments);
  }

  /**
      Sets the copyright information for self.
      
      This should be a short string of one or two lines, for example:
      `© 2022 Example`.
      
      The copyright information will be displayed on the Legal page, before the
      application license.
      
      [adw.about_window.AboutWindow.addLegalSection] can be used to add copyright
      information for the application dependencies or other components.
  
      Params:
        copyright = the copyright information
  */
  void setCopyright(string copyright)
  {
    const(char)* _copyright = copyright.toCString(No.Alloc);
    adw_about_window_set_copyright(cast(AdwAboutWindow*)this._cPtr, _copyright);
  }

  /**
      Sets the debug information for self.
      
      Debug information will be shown on the Troubleshooting page. It's intended
      to be attached to issue reports when reporting issues against the
      application.
      
      [adw.about_window.AboutWindow] provides a quick way to save debug information to a file.
      When saving, `propertyAboutWindow:debug-info-filename` would be used as
      the suggested filename.
      
      Debug information cannot contain markup or links.
  
      Params:
        debugInfo = the debug information
  */
  void setDebugInfo(string debugInfo)
  {
    const(char)* _debugInfo = debugInfo.toCString(No.Alloc);
    adw_about_window_set_debug_info(cast(AdwAboutWindow*)this._cPtr, _debugInfo);
  }

  /**
      Sets the debug information filename for self.
      
      It will be used as the suggested filename when saving debug information to a
      file.
      
      See `propertyAboutWindow:debug-info`.
  
      Params:
        filename = the debug info filename
  */
  void setDebugInfoFilename(string filename)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    adw_about_window_set_debug_info_filename(cast(AdwAboutWindow*)this._cPtr, _filename);
  }

  /**
      Sets the list of designers of the application.
      
      It will be displayed on the Credits page.
      
      Each name may contain email addresses and URLs, see the introduction for more
      details.
      
      See also:
      
      $(LIST
        * `propertyAboutWindow:developers`
        * `propertyAboutWindow:artists`
        * `propertyAboutWindow:documenters`
        * `propertyAboutWindow:translator-credits`
        * [adw.about_window.AboutWindow.addCreditSection]
        * [adw.about_window.AboutWindow.addAcknowledgementSection]
      )
  
      Params:
        designers = the list of designers
  */
  void setDesigners(string[] designers = null)
  {
    char*[] _tmpdesigners;
    foreach (s; designers)
      _tmpdesigners ~= s.toCString(No.Alloc);
    _tmpdesigners ~= null;
    const(char*)* _designers = _tmpdesigners.ptr;

    adw_about_window_set_designers(cast(AdwAboutWindow*)this._cPtr, _designers);
  }

  /**
      Sets the developer name for self.
      
      The developer name is displayed on the main page, under the application name.
      
      If the application is developed by multiple people, the developer name can be
      set to values like "AppName team", "AppName developers" or
      "The AppName project", and the individual contributors can be listed on the
      Credits page, with `propertyAboutWindow:developers` and related properties.
  
      Params:
        developerName = the developer name
  */
  void setDeveloperName(string developerName)
  {
    const(char)* _developerName = developerName.toCString(No.Alloc);
    adw_about_window_set_developer_name(cast(AdwAboutWindow*)this._cPtr, _developerName);
  }

  /**
      Sets the list of developers of the application.
      
      It will be displayed on the Credits page.
      
      Each name may contain email addresses and URLs, see the introduction for more
      details.
      
      See also:
      
      $(LIST
        * `propertyAboutWindow:designers`
        * `propertyAboutWindow:artists`
        * `propertyAboutWindow:documenters`
        * `propertyAboutWindow:translator-credits`
        * [adw.about_window.AboutWindow.addCreditSection]
        * [adw.about_window.AboutWindow.addAcknowledgementSection]
      )
  
      Params:
        developers = the list of developers
  */
  void setDevelopers(string[] developers = null)
  {
    char*[] _tmpdevelopers;
    foreach (s; developers)
      _tmpdevelopers ~= s.toCString(No.Alloc);
    _tmpdevelopers ~= null;
    const(char*)* _developers = _tmpdevelopers.ptr;

    adw_about_window_set_developers(cast(AdwAboutWindow*)this._cPtr, _developers);
  }

  /**
      Sets the list of documenters of the application.
      
      It will be displayed on the Credits page.
      
      Each name may contain email addresses and URLs, see the introduction for more
      details.
      
      See also:
      
      $(LIST
        * `propertyAboutWindow:developers`
        * `propertyAboutWindow:designers`
        * `propertyAboutWindow:artists`
        * `propertyAboutWindow:translator-credits`
        * [adw.about_window.AboutWindow.addCreditSection]
        * [adw.about_window.AboutWindow.addAcknowledgementSection]
      )
  
      Params:
        documenters = the list of documenters
  */
  void setDocumenters(string[] documenters = null)
  {
    char*[] _tmpdocumenters;
    foreach (s; documenters)
      _tmpdocumenters ~= s.toCString(No.Alloc);
    _tmpdocumenters ~= null;
    const(char*)* _documenters = _tmpdocumenters.ptr;

    adw_about_window_set_documenters(cast(AdwAboutWindow*)this._cPtr, _documenters);
  }

  /**
      Sets the issue tracker URL for self.
      
      The issue tracker link is displayed on the main page.
  
      Params:
        issueUrl = the issue tracker URL
  */
  void setIssueUrl(string issueUrl)
  {
    const(char)* _issueUrl = issueUrl.toCString(No.Alloc);
    adw_about_window_set_issue_url(cast(AdwAboutWindow*)this._cPtr, _issueUrl);
  }

  /**
      Sets the license for self.
      
      This can be used to set a custom text for the license if it can't be set via
      `propertyAboutWindow:license-type`.
      
      When set, `propertyAboutWindow:license-type` will be set to
      [gtk.types.License.Custom].
      
      The license text will be displayed on the Legal page, below the copyright
      information.
      
      License text can contain Pango markup and links.
      
      [adw.about_window.AboutWindow.addLegalSection] can be used to add license information
      for the application dependencies or other components.
  
      Params:
        license = the license
  */
  void setLicense(string license)
  {
    const(char)* _license = license.toCString(No.Alloc);
    adw_about_window_set_license(cast(AdwAboutWindow*)this._cPtr, _license);
  }

  /**
      Sets the license for self from a list of known licenses.
      
      If the application's license is not in the list,
      `propertyAboutWindow:license` can be used instead. The license type will be
      automatically set to [gtk.types.License.Custom] in that case.
      
      If license_type is [gtk.types.License.Unknown], no information will be displayed.
      
      If license_type is different from [gtk.types.License.Custom].
      `propertyAboutWindow:license` will be cleared out.
      
      The license description will be displayed on the Legal page, below the
      copyright information.
      
      [adw.about_window.AboutWindow.addLegalSection] can be used to add license information
      for the application dependencies or other components.
  
      Params:
        licenseType = the license type
  */
  void setLicenseType(gtk.types.License licenseType)
  {
    adw_about_window_set_license_type(cast(AdwAboutWindow*)this._cPtr, licenseType);
  }

  /**
      Sets the release notes for self.
      
      Release notes are displayed on the the What's New page.
      
      Release notes are formatted the same way as
      [AppStream descriptions](https://freedesktop.org/software/appstream/docs/chap-Metadata.html#tag-description).
      
      The supported formatting options are:
      
      $(LIST
        * Paragraph (`<p>`)
        * Ordered list (`<ol>`), with list items (`<li>`)
        * Unordered list (`<ul>`), with list items (`<li>`)
      )
        
      Within paragraphs and list items, emphasis (`<em>`) and inline code
      (`<code>`) text styles are supported. The emphasis is rendered in italic,
      while inline code is shown in a monospaced font.
      
      Any text outside paragraphs or list items is ignored.
      
      Nested lists are not supported.
      
      [adw.about_window.AboutWindow] displays the version above the release notes. If set, the
      `propertyAboutWindow:release-notes-version` of the property will be used
      as the version; otherwise, `propertyAboutWindow:version` is used.
  
      Params:
        releaseNotes = the release notes
  */
  void setReleaseNotes(string releaseNotes)
  {
    const(char)* _releaseNotes = releaseNotes.toCString(No.Alloc);
    adw_about_window_set_release_notes(cast(AdwAboutWindow*)this._cPtr, _releaseNotes);
  }

  /**
      Sets the version described by the application's release notes.
      
      The release notes version is displayed on the What's New page, above the
      release notes.
      
      If not set, `propertyAboutWindow:version` will be used instead.
      
      For example, an application with the current version 2.0.2 might want to
      keep the release notes from 2.0.0, and set the release notes version
      accordingly.
      
      See `propertyAboutWindow:release-notes`.
  
      Params:
        version_ = the release notes version
  */
  void setReleaseNotesVersion(string version_)
  {
    const(char)* _version_ = version_.toCString(No.Alloc);
    adw_about_window_set_release_notes_version(cast(AdwAboutWindow*)this._cPtr, _version_);
  }

  /**
      Sets the URL of the support page for self.
      
      The support page link is displayed on the main page.
  
      Params:
        supportUrl = the support page URL
  */
  void setSupportUrl(string supportUrl)
  {
    const(char)* _supportUrl = supportUrl.toCString(No.Alloc);
    adw_about_window_set_support_url(cast(AdwAboutWindow*)this._cPtr, _supportUrl);
  }

  /**
      Sets the translator credits string.
      
      It will be displayed on the Credits page.
      
      This string should be `"translator-credits"` or `"translator_credits"` and
      should be marked as translatable.
      
      The string may contain email addresses and URLs, see the introduction for
      more details.
      
      See also:
      
      $(LIST
        * `propertyAboutWindow:developers`
        * `propertyAboutWindow:designers`
        * `propertyAboutWindow:artists`
        * `propertyAboutWindow:documenters`
        * [adw.about_window.AboutWindow.addCreditSection]
        * [adw.about_window.AboutWindow.addAcknowledgementSection]
      )
  
      Params:
        translatorCredits = the translator credits
  */
  void setTranslatorCredits(string translatorCredits)
  {
    const(char)* _translatorCredits = translatorCredits.toCString(No.Alloc);
    adw_about_window_set_translator_credits(cast(AdwAboutWindow*)this._cPtr, _translatorCredits);
  }

  /**
      Sets the version for self.
      
      The version is displayed on the main page.
      
      If `propertyAboutWindow:release-notes-version` is not set, the version will
      also be displayed above the release notes on the What's New page.
  
      Params:
        version_ = the version
  */
  void setVersion(string version_)
  {
    const(char)* _version_ = version_.toCString(No.Alloc);
    adw_about_window_set_version(cast(AdwAboutWindow*)this._cPtr, _version_);
  }

  /**
      Sets the application website URL for self.
      
      Website is displayed on the Details page, below comments, or on the main page
      if the Details page doesn't have any other content.
      
      Applications can add other links below, see [adw.about_window.AboutWindow.addLink].
  
      Params:
        website = the website URL
  */
  void setWebsite(string website)
  {
    const(char)* _website = website.toCString(No.Alloc);
    adw_about_window_set_website(cast(AdwAboutWindow*)this._cPtr, _website);
  }

  /**
      Connect to `ActivateLink` signal.
  
      Emitted when a URL is activated.
        
        Applications may connect to it to override the default behavior, which is
        to call `funcGtk.show_uri`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(string uri, adw.about_window.AboutWindow aboutWindow))
  
          `uri` the URI to activate (optional)
  
          `aboutWindow` the instance the signal is connected to (optional)
  
          `Returns` `TRUE` if the link has been activated
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateLink(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : adw.about_window.AboutWindow)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-link", closure, after);
  }
}
