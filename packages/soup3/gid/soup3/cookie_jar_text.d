/// Module for [CookieJarText] class
module gid.soup3.cookie_jar_text;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.cookie_jar;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;
import gid.soup3.types;

/**
    Text-file-based ("cookies.txt") Cookie Jar
    
    [gid.soup3.cookie_jar_text.CookieJarText] is a [gid.soup3.cookie_jar.CookieJar] that reads cookies from and writes
    them to a text file in format similar to Mozilla's "cookies.txt".
*/
class CookieJarText : gid.soup3.cookie_jar.CookieJar
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_cookie_jar_text_get_type != &gidSymbolNotFound ? soup_cookie_jar_text_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupCookieJarText";
  }

  /** Returns `this`, for use in `with` statements. */
  override CookieJarText self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.cookie_jar_text.CookieJarText]
      Returns: New builder object
  */
  static CookieJarTextGidBuilder builder() nothrow
  {
    return new CookieJarTextGidBuilder;
  }

  /**
      Get `filename` property.
      Returns: Cookie-storage filename.
  */
  @property string filename() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("filename");
  }

  /**
      Creates a [gid.soup3.cookie_jar_text.CookieJarText].
      
      filename will be read in at startup to create an initial set of cookies. If
      read_only is false, then the non-session cookies will be written to
      filename when the [gid.soup3.cookie_jar.CookieJar.changed] signal is emitted from the
      jar. (If read_only is true, then the cookie jar will only be used for this
      session, and changes made to it will be lost when the jar is destroyed.)
  
      Params:
        filename = the filename to read to/write from
        readOnly = true if filename is read-only
      Returns: the new #SoupCookieJar
  */
  this(string filename, bool readOnly) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      SoupCookieJar* _cretval;
      const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
      _cretval = soup_cookie_jar_text_new(_filename, readOnly);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.soup3.cookie_jar_text.CookieJarText]
class CookieJarTextGidBuilderImpl(T) : gid.soup3.cookie_jar.CookieJarGidBuilderImpl!T
{


  /**
      Set `filename` property.
      Params:
        propval = Cookie-storage filename.
      Returns: Builder instance for fluent chaining
  */
  T filename(string propval) nothrow
  {
    return setProperty("filename", propval);
  }
}

/// Fluent builder for [gid.soup3.cookie_jar_text.CookieJarText]
final class CookieJarTextGidBuilder : CookieJarTextGidBuilderImpl!CookieJarTextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CookieJarText build() nothrow
  {
    return new CookieJarText(cast(void*)createGObject(CookieJarText._getGType), Yes.Take);
  }
}
