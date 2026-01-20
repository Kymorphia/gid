/// Module for [AboutDialog] class
module gtk.about_dialog;

import gdk.paintable;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.window;

/**
    The [gtk.about_dialog.AboutDialog] offers a simple way to display information about
    a program.
    
    The shown information includes the programs' logo, name, copyright,
    website and license. It is also possible to give credits to the authors,
    documenters, translators and artists who have worked on the program.
    
    An about dialog is typically opened when the user selects the `About`
    option from the `Help` menu. All parts of the dialog are optional.
    
    ![An example GtkAboutDialog](aboutdialog.png)
    
    About dialogs often contain links and email addresses. [gtk.about_dialog.AboutDialog]
    displays these as clickable links. By default, it calls [gtk.file_launcher.FileLauncher.launch]
    when a user clicks one. The behaviour can be overridden with the
    `signal@Gtk.AboutDialog::activate-link` signal.
    
    To specify a person with an email address, use a string like
    `Edgar Allan Poe <edgar@poe.com>`. To specify a website with a title,
    use a string like `GTK team https://www.gtk.org`.
    
    To make constructing a [gtk.about_dialog.AboutDialog] as convenient as possible, you can
    use the function `func@Gtk.show_about_dialog` which constructs and shows
    a dialog and keeps it around so that it can be shown again.
    
    Note that GTK sets a default title of `_("About `s`")` on the dialog
    window (where ``s`` is replaced by the name of the application, but in
    order to ensure proper translation of the title, applications should
    set the title property explicitly when constructing a [gtk.about_dialog.AboutDialog],
    as shown in the following example:
    
    ```c
    GFile *logo_file = g_file_new_for_path ("./logo.png");
    GdkTexture *example_logo = gdk_texture_new_from_file (logo_file, NULL);
    g_object_unref (logo_file);
    
    gtk_show_about_dialog (NULL,
                           "program-name", "ExampleCode",
                           "logo", example_logo,
                           "title", _("About ExampleCode"),
                           NULL);
    ```
    
    ## CSS nodes
    
    [gtk.about_dialog.AboutDialog] has a single CSS node with the name `window` and style
    class `.aboutdialog`.
*/
class AboutDialog : gtk.window.Window
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
    return cast(void function())gtk_about_dialog_get_type != &gidSymbolNotFound ? gtk_about_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AboutDialog self()
  {
    return this;
  }

  /**
      Get `comments` property.
      Returns: Comments about the program.
        
        This string is displayed in a label in the main dialog, thus it
        should be a short explanation of the main purpose of the program,
        not a detailed list of features.
  */
  @property string comments()
  {
    return getComments();
  }

  /**
      Set `comments` property.
      Params:
        propval = Comments about the program.
          
          This string is displayed in a label in the main dialog, thus it
          should be a short explanation of the main purpose of the program,
          not a detailed list of features.
  */
  @property void comments(string propval)
  {
    return setComments(propval);
  }

  /**
      Get `copyright` property.
      Returns: Copyright information for the program.
  */
  @property string copyright()
  {
    return getCopyright();
  }

  /**
      Set `copyright` property.
      Params:
        propval = Copyright information for the program.
  */
  @property void copyright(string propval)
  {
    return setCopyright(propval);
  }

  /**
      Get `license` property.
      Returns: The license of the program, as free-form text.
        
        This string is displayed in a text view in a secondary dialog, therefore
        it is fine to use a long multi-paragraph text. Note that the text is only
        wrapped in the text view if the "wrap-license" property is set to `TRUE`;
        otherwise the text itself must contain the intended linebreaks.
        
        When setting this property to a non-`NULL` value, the
        [gtk.about_dialog.AboutDialog.license] property is set to
        [gtk.types.License.Custom] as a side effect.
        
        The text may contain links in this format `<http://www.some.place/>`
        and email references in the form `<mail-to@some.body>`, and these will
        be converted into clickable links.
  */
  @property string license()
  {
    return getLicense();
  }

  /**
      Set `license` property.
      Params:
        propval = The license of the program, as free-form text.
          
          This string is displayed in a text view in a secondary dialog, therefore
          it is fine to use a long multi-paragraph text. Note that the text is only
          wrapped in the text view if the "wrap-license" property is set to `TRUE`;
          otherwise the text itself must contain the intended linebreaks.
          
          When setting this property to a non-`NULL` value, the
          [gtk.about_dialog.AboutDialog.license] property is set to
          [gtk.types.License.Custom] as a side effect.
          
          The text may contain links in this format `<http://www.some.place/>`
          and email references in the form `<mail-to@some.body>`, and these will
          be converted into clickable links.
  */
  @property void license(string propval)
  {
    return setLicense(propval);
  }

  /**
      Get `licenseType` property.
      Returns: The license of the program.
        
        The [gtk.about_dialog.AboutDialog] will automatically fill out a standard disclaimer
        and link the user to the appropriate online resource for the license
        text.
        
        If [gtk.types.License.Unknown] is used, the link used will be the same
        specified in the [gtk.about_dialog.AboutDialog.website] property.
        
        If [gtk.types.License.Custom] is used, the current contents of the
        [gtk.about_dialog.AboutDialog.license] property are used.
        
        For any other [gtk.types.License] value, the contents of the
        [gtk.about_dialog.AboutDialog.license] property are also set by this property as
        a side effect.
  */
  @property gtk.types.License licenseType()
  {
    return getLicenseType();
  }

  /**
      Set `licenseType` property.
      Params:
        propval = The license of the program.
          
          The [gtk.about_dialog.AboutDialog] will automatically fill out a standard disclaimer
          and link the user to the appropriate online resource for the license
          text.
          
          If [gtk.types.License.Unknown] is used, the link used will be the same
          specified in the [gtk.about_dialog.AboutDialog.website] property.
          
          If [gtk.types.License.Custom] is used, the current contents of the
          [gtk.about_dialog.AboutDialog.license] property are used.
          
          For any other [gtk.types.License] value, the contents of the
          [gtk.about_dialog.AboutDialog.license] property are also set by this property as
          a side effect.
  */
  @property void licenseType(gtk.types.License propval)
  {
    return setLicenseType(propval);
  }

  /**
      Get `logo` property.
      Returns: A logo for the about box.
        
        If it is `NULL`, the default window icon set with
        [gtk.window.Window.setDefaultIconName] will be used.
  */
  @property gdk.paintable.Paintable logo()
  {
    return getLogo();
  }

  /**
      Set `logo` property.
      Params:
        propval = A logo for the about box.
          
          If it is `NULL`, the default window icon set with
          [gtk.window.Window.setDefaultIconName] will be used.
  */
  @property void logo(gdk.paintable.Paintable propval)
  {
    return setLogo(propval);
  }

  /**
      Get `logoIconName` property.
      Returns: A named icon to use as the logo for the about box.
        
        This property overrides the [gtk.about_dialog.AboutDialog.logo] property.
  */
  @property string logoIconName()
  {
    return getLogoIconName();
  }

  /**
      Set `logoIconName` property.
      Params:
        propval = A named icon to use as the logo for the about box.
          
          This property overrides the [gtk.about_dialog.AboutDialog.logo] property.
  */
  @property void logoIconName(string propval)
  {
    return setLogoIconName(propval);
  }

  /**
      Get `programName` property.
      Returns: The name of the program.
        
        If this is not set, it defaults to the value returned by
        `[glib.global.getApplicationName]`.
  */
  @property string programName()
  {
    return getProgramName();
  }

  /**
      Set `programName` property.
      Params:
        propval = The name of the program.
          
          If this is not set, it defaults to the value returned by
          `[glib.global.getApplicationName]`.
  */
  @property void programName(string propval)
  {
    return setProgramName(propval);
  }

  /**
      Get `systemInformation` property.
      Returns: Information about the system on which the program is running.
        
        This information is displayed in a separate page, therefore it is fine
        to use a long multi-paragraph text. Note that the text should contain
        the intended linebreaks.
        
        The text may contain links in this format `<http://www.some.place/>`
        and email references in the form `<mail-to@some.body>`, and these will
        be converted into clickable links.
  */
  @property string systemInformation()
  {
    return getSystemInformation();
  }

  /**
      Set `systemInformation` property.
      Params:
        propval = Information about the system on which the program is running.
          
          This information is displayed in a separate page, therefore it is fine
          to use a long multi-paragraph text. Note that the text should contain
          the intended linebreaks.
          
          The text may contain links in this format `<http://www.some.place/>`
          and email references in the form `<mail-to@some.body>`, and these will
          be converted into clickable links.
  */
  @property void systemInformation(string propval)
  {
    return setSystemInformation(propval);
  }

  /**
      Get `translatorCredits` property.
      Returns: Credits to the translators.
        
        This string should be marked as translatable.
        
        The string may contain email addresses and URLs, which will be displayed
        as links, see the introduction for more details.
  */
  @property string translatorCredits()
  {
    return getTranslatorCredits();
  }

  /**
      Set `translatorCredits` property.
      Params:
        propval = Credits to the translators.
          
          This string should be marked as translatable.
          
          The string may contain email addresses and URLs, which will be displayed
          as links, see the introduction for more details.
  */
  @property void translatorCredits(string propval)
  {
    return setTranslatorCredits(propval);
  }

  /**
      Get `version_` property.
      Returns: The version of the program.
  */
  @property string version_()
  {
    return getVersion();
  }

  /**
      Set `version_` property.
      Params:
        propval = The version of the program.
  */
  @property void version_(string propval)
  {
    return setVersion(propval);
  }

  /**
      Get `website` property.
      Returns: The URL for the link to the website of the program.
        
        This should be a string starting with `http://` or `https://`.
  */
  @property string website()
  {
    return getWebsite();
  }

  /**
      Set `website` property.
      Params:
        propval = The URL for the link to the website of the program.
          
          This should be a string starting with `http://` or `https://`.
  */
  @property void website(string propval)
  {
    return setWebsite(propval);
  }

  /**
      Get `websiteLabel` property.
      Returns: The label for the link to the website of the program.
  */
  @property string websiteLabel()
  {
    return getWebsiteLabel();
  }

  /**
      Set `websiteLabel` property.
      Params:
        propval = The label for the link to the website of the program.
  */
  @property void websiteLabel(string propval)
  {
    return setWebsiteLabel(propval);
  }

  /**
      Get `wrapLicense` property.
      Returns: Whether to wrap the text in the license dialog.
  */
  @property bool wrapLicense()
  {
    return getWrapLicense();
  }

  /**
      Set `wrapLicense` property.
      Params:
        propval = Whether to wrap the text in the license dialog.
  */
  @property void wrapLicense(bool propval)
  {
    return setWrapLicense(propval);
  }

  /**
      Creates a new [gtk.about_dialog.AboutDialog].
      Returns: a newly created [gtk.about_dialog.AboutDialog]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_about_dialog_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new section in the "Credits" page.
  
      Params:
        sectionName = The name of the section
        people = The people who belong to that section
  */
  void addCreditSection(string sectionName, string[] people)
  {
    const(char)* _sectionName = sectionName.toCString(No.Alloc);
    char*[] _tmppeople;
    foreach (s; people)
      _tmppeople ~= s.toCString(No.Alloc);
    _tmppeople ~= null;
    const(char*)* _people = _tmppeople.ptr;

    gtk_about_dialog_add_credit_section(cast(GtkAboutDialog*)this._cPtr, _sectionName, _people);
  }

  /**
      Returns the names of the artists which are displayed
      in the credits page.
      Returns: A
          `NULL`-terminated string array containing the artists
  */
  string[] getArtists()
  {
    const(char*)* _cretval;
    _cretval = gtk_about_dialog_get_artists(cast(GtkAboutDialog*)this._cPtr);
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
      Returns the names of the authors which are displayed
      in the credits page.
      Returns: A
          `NULL`-terminated string array containing the authors
  */
  string[] getAuthors()
  {
    const(char*)* _cretval;
    _cretval = gtk_about_dialog_get_authors(cast(GtkAboutDialog*)this._cPtr);
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
      Returns the comments string.
      Returns: The comments
  */
  string getComments()
  {
    const(char)* _cretval;
    _cretval = gtk_about_dialog_get_comments(cast(GtkAboutDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the copyright string.
      Returns: The copyright string
  */
  string getCopyright()
  {
    const(char)* _cretval;
    _cretval = gtk_about_dialog_get_copyright(cast(GtkAboutDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the name of the documenters which are displayed
      in the credits page.
      Returns: A
          `NULL`-terminated string array containing the documenters
  */
  string[] getDocumenters()
  {
    const(char*)* _cretval;
    _cretval = gtk_about_dialog_get_documenters(cast(GtkAboutDialog*)this._cPtr);
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
      Returns the license information.
      Returns: The license information
  */
  string getLicense()
  {
    const(char)* _cretval;
    _cretval = gtk_about_dialog_get_license(cast(GtkAboutDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the license type.
      Returns: a [gtk.types.License] value
  */
  gtk.types.License getLicenseType()
  {
    GtkLicense _cretval;
    _cretval = gtk_about_dialog_get_license_type(cast(GtkAboutDialog*)this._cPtr);
    gtk.types.License _retval = cast(gtk.types.License)_cretval;
    return _retval;
  }

  /**
      Returns the paintable displayed as logo in the about dialog.
      Returns: the paintable displayed as
          logo or `NULL` if the logo is unset or has been set via
          [gtk.about_dialog.AboutDialog.setLogoIconName]
  */
  gdk.paintable.Paintable getLogo()
  {
    GdkPaintable* _cretval;
    _cretval = gtk_about_dialog_get_logo(cast(GtkAboutDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the icon name displayed as logo in the about dialog.
      Returns: the icon name displayed as logo,
          or `NULL` if the logo has been set via [gtk.about_dialog.AboutDialog.setLogo]
  */
  string getLogoIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_about_dialog_get_logo_icon_name(cast(GtkAboutDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the program name displayed in the about dialog.
      Returns: The program name
  */
  string getProgramName()
  {
    const(char)* _cretval;
    _cretval = gtk_about_dialog_get_program_name(cast(GtkAboutDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the system information that is shown in the about dialog.
      Returns: the system information
  */
  string getSystemInformation()
  {
    const(char)* _cretval;
    _cretval = gtk_about_dialog_get_system_information(cast(GtkAboutDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the translator credits string which is displayed
      in the credits page.
      Returns: The translator credits string
  */
  string getTranslatorCredits()
  {
    const(char)* _cretval;
    _cretval = gtk_about_dialog_get_translator_credits(cast(GtkAboutDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the version string.
      Returns: The version string
  */
  string getVersion()
  {
    const(char)* _cretval;
    _cretval = gtk_about_dialog_get_version(cast(GtkAboutDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the website URL.
      Returns: The website URL
  */
  string getWebsite()
  {
    const(char)* _cretval;
    _cretval = gtk_about_dialog_get_website(cast(GtkAboutDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the label used for the website link.
      Returns: The label used for the website link
  */
  string getWebsiteLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_about_dialog_get_website_label(cast(GtkAboutDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the license text in the about dialog is
      automatically wrapped.
      Returns: `TRUE` if the license text is wrapped
  */
  bool getWrapLicense()
  {
    bool _retval;
    _retval = cast(bool)gtk_about_dialog_get_wrap_license(cast(GtkAboutDialog*)this._cPtr);
    return _retval;
  }

  /**
      Sets the names of the artists to be displayed
      in the "Credits" page.
  
      Params:
        artists = the authors of the artwork
            of the application
  */
  void setArtists(string[] artists)
  {
    char*[] _tmpartists;
    foreach (s; artists)
      _tmpartists ~= s.toCString(No.Alloc);
    _tmpartists ~= null;
    const(char*)* _artists = _tmpartists.ptr;

    gtk_about_dialog_set_artists(cast(GtkAboutDialog*)this._cPtr, _artists);
  }

  /**
      Sets the names of the authors which are displayed
      in the "Credits" page of the about dialog.
  
      Params:
        authors = the authors of the application
  */
  void setAuthors(string[] authors)
  {
    char*[] _tmpauthors;
    foreach (s; authors)
      _tmpauthors ~= s.toCString(No.Alloc);
    _tmpauthors ~= null;
    const(char*)* _authors = _tmpauthors.ptr;

    gtk_about_dialog_set_authors(cast(GtkAboutDialog*)this._cPtr, _authors);
  }

  /**
      Sets the comments string to display in the about dialog.
      
      This should be a short string of one or two lines.
  
      Params:
        comments = a comments string
  */
  void setComments(string comments = null)
  {
    const(char)* _comments = comments.toCString(No.Alloc);
    gtk_about_dialog_set_comments(cast(GtkAboutDialog*)this._cPtr, _comments);
  }

  /**
      Sets the copyright string to display in the about dialog.
      
      This should be a short string of one or two lines.
  
      Params:
        copyright = the copyright string
  */
  void setCopyright(string copyright = null)
  {
    const(char)* _copyright = copyright.toCString(No.Alloc);
    gtk_about_dialog_set_copyright(cast(GtkAboutDialog*)this._cPtr, _copyright);
  }

  /**
      Sets the names of the documenters which are displayed
      in the "Credits" page.
  
      Params:
        documenters = the authors of the documentation
            of the application
  */
  void setDocumenters(string[] documenters)
  {
    char*[] _tmpdocumenters;
    foreach (s; documenters)
      _tmpdocumenters ~= s.toCString(No.Alloc);
    _tmpdocumenters ~= null;
    const(char*)* _documenters = _tmpdocumenters.ptr;

    gtk_about_dialog_set_documenters(cast(GtkAboutDialog*)this._cPtr, _documenters);
  }

  /**
      Sets the license information to be displayed in the
      about dialog.
      
      If `license` is `NULL`, the license page is hidden.
  
      Params:
        license = the license information
  */
  void setLicense(string license = null)
  {
    const(char)* _license = license.toCString(No.Alloc);
    gtk_about_dialog_set_license(cast(GtkAboutDialog*)this._cPtr, _license);
  }

  /**
      Sets the license of the application showing the about dialog from a
      list of known licenses.
      
      This function overrides the license set using
      [gtk.about_dialog.AboutDialog.setLicense].
  
      Params:
        licenseType = the type of license
  */
  void setLicenseType(gtk.types.License licenseType)
  {
    gtk_about_dialog_set_license_type(cast(GtkAboutDialog*)this._cPtr, licenseType);
  }

  /**
      Sets the logo in the about dialog.
  
      Params:
        logo = a [gdk.paintable.Paintable]
  */
  void setLogo(gdk.paintable.Paintable logo = null)
  {
    gtk_about_dialog_set_logo(cast(GtkAboutDialog*)this._cPtr, logo ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)logo)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon name to be displayed as logo in the about dialog.
  
      Params:
        iconName = an icon name
  */
  void setLogoIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_about_dialog_set_logo_icon_name(cast(GtkAboutDialog*)this._cPtr, _iconName);
  }

  /**
      Sets the name to display in the about dialog.
      
      If `name` is not set, the string returned
      by `[glib.global.getApplicationName]` is used.
  
      Params:
        name = the program name
  */
  void setProgramName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_about_dialog_set_program_name(cast(GtkAboutDialog*)this._cPtr, _name);
  }

  /**
      Sets the system information to be displayed in the about
      dialog.
      
      If `system_information` is `NULL`, the system information
      page is hidden.
      
      See `propertyGtk.AboutDialog:system-information`.
  
      Params:
        systemInformation = system information
  */
  void setSystemInformation(string systemInformation = null)
  {
    const(char)* _systemInformation = systemInformation.toCString(No.Alloc);
    gtk_about_dialog_set_system_information(cast(GtkAboutDialog*)this._cPtr, _systemInformation);
  }

  /**
      Sets the translator credits string which is displayed in
      the credits page.
      
      The intended use for this string is to display the translator
      of the language which is currently used in the user interface.
      Using `gettext()`, a simple way to achieve that is to mark the
      string for translation:
      
      ```c
      GtkWidget *about = gtk_about_dialog_new ();
       gtk_about_dialog_set_translator_credits (GTK_ABOUT_DIALOG (about),
                                                _("translator-credits"));
      ```
      
      It is a good idea to use the customary `msgid` “translator-credits”
      for this purpose, since translators will already know the purpose of
      that `msgid`, and since [gtk.about_dialog.AboutDialog] will detect if “translator-credits”
      is untranslated and omit translator credits.
  
      Params:
        translatorCredits = the translator credits
  */
  void setTranslatorCredits(string translatorCredits = null)
  {
    const(char)* _translatorCredits = translatorCredits.toCString(No.Alloc);
    gtk_about_dialog_set_translator_credits(cast(GtkAboutDialog*)this._cPtr, _translatorCredits);
  }

  /**
      Sets the version string to display in the about dialog.
  
      Params:
        version_ = the version string
  */
  void setVersion(string version_ = null)
  {
    const(char)* _version_ = version_.toCString(No.Alloc);
    gtk_about_dialog_set_version(cast(GtkAboutDialog*)this._cPtr, _version_);
  }

  /**
      Sets the URL to use for the website link.
  
      Params:
        website = a URL string starting with `http://`
  */
  void setWebsite(string website = null)
  {
    const(char)* _website = website.toCString(No.Alloc);
    gtk_about_dialog_set_website(cast(GtkAboutDialog*)this._cPtr, _website);
  }

  /**
      Sets the label to be used for the website link.
  
      Params:
        websiteLabel = the label used for the website link
  */
  void setWebsiteLabel(string websiteLabel)
  {
    const(char)* _websiteLabel = websiteLabel.toCString(No.Alloc);
    gtk_about_dialog_set_website_label(cast(GtkAboutDialog*)this._cPtr, _websiteLabel);
  }

  /**
      Sets whether the license text in the about dialog should be
      automatically wrapped.
  
      Params:
        wrapLicense = whether to wrap the license
  */
  void setWrapLicense(bool wrapLicense)
  {
    gtk_about_dialog_set_wrap_license(cast(GtkAboutDialog*)this._cPtr, wrapLicense);
  }

  /**
      Connect to `ActivateLink` signal.
  
      Emitted every time a URL is activated.
        
        Applications may connect to it to override the default behaviour,
        which is to call [gtk.file_launcher.FileLauncher.launch].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(string uri, gtk.about_dialog.AboutDialog aboutDialog))
  
          `uri` the URI that is activated (optional)
  
          `aboutDialog` the instance the signal is connected to (optional)
  
          `Returns` `TRUE` if the link has been activated
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateLink(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.about_dialog.AboutDialog)))
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
