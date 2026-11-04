/// Module for [IMContextInfo] class
module gtk.imcontext_info;

public import gid.basictypes;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Bookkeeping information about a loadable input method.
*/
class IMContextInfo : StructWrap!(GtkIMContextInfo)
{
  /**
      Create a `imcontext_info.IMContextInfo` wrap type.
      Params:
        contextId = The unique identification string of the input method.
        contextName = The human-readable name of the input method.
        domain = Translation domain to be used with dgettext()
        domainDirname = Name of locale directory for use with bindtextdomain()
        defaultLocales = A colon-separated list of locales where this input method
            should be the default. The asterisk “*” sets the default for all locales.
  */
  this(string contextId = string.init, string contextName = string.init, string domain = string.init, string domainDirname = string.init, string defaultLocales = string.init) nothrow
  {
    this.contextId = contextId;
    this.contextName = contextName;
    this.domain = domain;
    this.domainDirname = domainDirname;
    this.defaultLocales = defaultLocales;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private const(char)* _contextIdRef; // Keeps borrowed GC string alive

  /**
      Get `contextId` field.
      Returns: The unique identification string of the input method.
  */
  @property string contextId() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)this._cPtr).contextId);
  }

  /**
      Set `contextId` field.
      Params:
        propval = The unique identification string of the input method.
  */
  @property void contextId(string propval) nothrow
  {
    if (_refuseBorrowedStore("contextId"))
      return;

    _contextIdRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkIMContextInfo*)this._cPtr).contextId = cast(const(char)*)_contextIdRef;
  }

  private const(char)* _contextNameRef; // Keeps borrowed GC string alive

  /**
      Get `contextName` field.
      Returns: The human-readable name of the input method.
  */
  @property string contextName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)this._cPtr).contextName);
  }

  /**
      Set `contextName` field.
      Params:
        propval = The human-readable name of the input method.
  */
  @property void contextName(string propval) nothrow
  {
    if (_refuseBorrowedStore("contextName"))
      return;

    _contextNameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkIMContextInfo*)this._cPtr).contextName = cast(const(char)*)_contextNameRef;
  }

  private const(char)* _domainRef; // Keeps borrowed GC string alive

  /**
      Get `domain` field.
      Returns: Translation domain to be used with dgettext()
  */
  @property string domain() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)this._cPtr).domain);
  }

  /**
      Set `domain` field.
      Params:
        propval = Translation domain to be used with dgettext()
  */
  @property void domain(string propval) nothrow
  {
    if (_refuseBorrowedStore("domain"))
      return;

    _domainRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkIMContextInfo*)this._cPtr).domain = cast(const(char)*)_domainRef;
  }

  private const(char)* _domainDirnameRef; // Keeps borrowed GC string alive

  /**
      Get `domainDirname` field.
      Returns: Name of locale directory for use with bindtextdomain()
  */
  @property string domainDirname() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)this._cPtr).domainDirname);
  }

  /**
      Set `domainDirname` field.
      Params:
        propval = Name of locale directory for use with bindtextdomain()
  */
  @property void domainDirname(string propval) nothrow
  {
    if (_refuseBorrowedStore("domainDirname"))
      return;

    _domainDirnameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkIMContextInfo*)this._cPtr).domainDirname = cast(const(char)*)_domainDirnameRef;
  }

  private const(char)* _defaultLocalesRef; // Keeps borrowed GC string alive

  /**
      Get `defaultLocales` field.
      Returns: A colon-separated list of locales where this input method
          should be the default. The asterisk “*” sets the default for all locales.
  */
  @property string defaultLocales() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)this._cPtr).defaultLocales);
  }

  /**
      Set `defaultLocales` field.
      Params:
        propval = A colon-separated list of locales where this input method
            should be the default. The asterisk “*” sets the default for all locales.
  */
  @property void defaultLocales(string propval) nothrow
  {
    if (_refuseBorrowedStore("defaultLocales"))
      return;

    _defaultLocalesRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkIMContextInfo*)this._cPtr).defaultLocales = cast(const(char)*)_defaultLocalesRef;
  }
}
