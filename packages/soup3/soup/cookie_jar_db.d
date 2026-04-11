/// Module for [CookieJarDB] class
module soup.cookie_jar_db;

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
    
    #SoupCookieJarDB is a `class@CookieJar` that reads cookies from and writes
    them to a sqlite database in the new Mozilla format.
    
    (This is identical to `SoupCookieJarSqlite` in
    libsoup-gnome; it has just been moved into libsoup proper, and
    renamed to avoid conflicting.)
*/
class CookieJarDB : soup.cookie_jar.CookieJar
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
    return cast(void function())soup_cookie_jar_db_get_type != &gidSymbolNotFound ? soup_cookie_jar_db_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CookieJarDB self()
  {
    return this;
  }

  /**
      Get builder for [soup.cookie_jar_db.CookieJarDB]
      Returns: New builder object
  */
  static CookieJarDBGidBuilder builder()
  {
    return new CookieJarDBGidBuilder;
  }

  /**
      Get `filename` property.
      Returns: Cookie-storage filename.
  */
  @property string filename()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("filename");
  }

  /**
      Creates a #SoupCookieJarDB.
      
      filename will be read in at startup to create an initial set of cookies. If
      read_only is false, then the non-session cookies will be written to
      filename when the `signalCookieJar::changed` signal is emitted from the
      jar. (If read_only is true, then the cookie jar will only be used for this
      session, and changes made to it will be lost when the jar is destroyed.)
  
      Params:
        filename = the filename to read to/write from, or null
        readOnly = true if filename is read-only
      Returns: the new #SoupCookieJar
  */
  this(string filename, bool readOnly)
  {
    SoupCookieJar* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
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
  T filename(string propval)
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
  CookieJarDB build()
  {
    return new CookieJarDB(cast(void*)createGObject(CookieJarDB._getGType), Yes.Take);
  }
}
