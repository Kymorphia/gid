/// Module for [IMContextInfo] class
module gtk.imcontext_info;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Bookkeeping information about a loadable input method.
*/
class IMContextInfo
{
  GtkIMContextInfo cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.imcontext_info.IMContextInfo");

    cInstance = *cast(GtkIMContextInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `contextId` field.
      Returns: The unique identification string of the input method.
  */
  @property string contextId()
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextId);
  }

  /**
      Set `contextId` field.
      Params:
        propval = The unique identification string of the input method.
  */
  @property void contextId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextId);
    dToC(propval, cast(void*)&(cast(GtkIMContextInfo*)cPtr).contextId);
  }

  /**
      Get `contextName` field.
      Returns: The human-readable name of the input method.
  */
  @property string contextName()
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextName);
  }

  /**
      Set `contextName` field.
      Params:
        propval = The human-readable name of the input method.
  */
  @property void contextName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextName);
    dToC(propval, cast(void*)&(cast(GtkIMContextInfo*)cPtr).contextName);
  }

  /**
      Get `domain` field.
      Returns: Translation domain to be used with dgettext()
  */
  @property string domain()
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).domain);
  }

  /**
      Set `domain` field.
      Params:
        propval = Translation domain to be used with dgettext()
  */
  @property void domain(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).domain);
    dToC(propval, cast(void*)&(cast(GtkIMContextInfo*)cPtr).domain);
  }

  /**
      Get `domainDirname` field.
      Returns: Name of locale directory for use with bindtextdomain()
  */
  @property string domainDirname()
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).domainDirname);
  }

  /**
      Set `domainDirname` field.
      Params:
        propval = Name of locale directory for use with bindtextdomain()
  */
  @property void domainDirname(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).domainDirname);
    dToC(propval, cast(void*)&(cast(GtkIMContextInfo*)cPtr).domainDirname);
  }

  /**
      Get `defaultLocales` field.
      Returns: A colon-separated list of locales where this input method
        should be the default. The asterisk “*” sets the default for all locales.
  */
  @property string defaultLocales()
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).defaultLocales);
  }

  /**
      Set `defaultLocales` field.
      Params:
        propval = A colon-separated list of locales where this input method
          should be the default. The asterisk “*” sets the default for all locales.
  */
  @property void defaultLocales(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).defaultLocales);
    dToC(propval, cast(void*)&(cast(GtkIMContextInfo*)cPtr).defaultLocales);
  }
}
