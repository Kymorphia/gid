/// Module for [CookieJarDB] class
module soup.cookie_jar_db;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.cookie_jar;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
    Database-based Cookie Jar.
    
    #SoupCookieJarDB is a [soup.cookie_jar.CookieJar] that reads cookies from and writes
    them to a sqlite database in the new Mozilla format.
    
    (This is identical to `SoupCookieJarSqlite` in
    libsoup-gnome; it has just been moved into libsoup proper, and
    renamed to avoid conflicting.)
*/
class CookieJarDB : soup.cookie_jar.CookieJar
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_cookie_jar_db_get_type != &gidSymbolNotFound ? soup_cookie_jar_db_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CookieJarDB self() nothrow
  {
    return this;
  }

  /**
      Get builder for [soup.cookie_jar_db.CookieJarDB]
      Returns: New builder object
  */
  static CookieJarDBGidBuilder builder() nothrow
  {
    return new CookieJarDBGidBuilder;
  }

  /**
      Get `filename` property.
      Returns: Cookie-storage filename.
  */
  @property string filename() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("filename");
  }

  /**
      Creates a #SoupCookieJarDB.
      
      filename will be read in at startup to create an initial set of cookies. If
      read_only is false, then the non-session cookies will be written to
      filename when the [soup.cookie_jar.CookieJar.changed] signal is emitted from the
      jar. (If read_only is true, then the cookie jar will only be used for this
      session, and changes made to it will be lost when the jar is destroyed.)
  
      Params:
        filename = the filename to read to/write from, or null
        readOnly = true if filename is read-only
      Returns: the new #SoupCookieJar
  */
  this(string filename, bool readOnly) nothrow
  {
    SoupCookieJar* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    _cretval = soup_cookie_jar_db_new(_filename, readOnly);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [soup.cookie_jar_db.CookieJarDB]
class CookieJarDBGidBuilderImpl(T) : soup.cookie_jar.CookieJarGidBuilderImpl!T
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

/// Fluent builder for [soup.cookie_jar_db.CookieJarDB]
final class CookieJarDBGidBuilder : CookieJarDBGidBuilderImpl!CookieJarDBGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CookieJarDB build() nothrow
  {
    return new CookieJarDB(cast(void*)createGObject(CookieJarDB._getGType), Yes.Take);
  }
}
