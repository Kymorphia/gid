/// Module for [HSTSEnforcerDB] class
module gid.soup3.hstsenforcer_db;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.hstsenforcer;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;
import gid.soup3.types;

/**
    Persistent HTTP Strict Transport Security enforcer.
    
    [gid.soup3.hstsenforcer_db.HSTSEnforcerDB] is a [gid.soup3.hstsenforcer.HSTSEnforcer] that uses a SQLite
    database as a backend for persistency.
*/
class HSTSEnforcerDB : gid.soup3.hstsenforcer.HSTSEnforcer
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_hsts_enforcer_db_get_type != &gidSymbolNotFound ? soup_hsts_enforcer_db_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupHSTSEnforcerDB";
  }

  /** Returns `this`, for use in `with` statements. */
  override HSTSEnforcerDB self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.hstsenforcer_db.HSTSEnforcerDB]
      Returns: New builder object
  */
  static HSTSEnforcerDBGidBuilder builder() nothrow
  {
    return new HSTSEnforcerDBGidBuilder;
  }

  /**
      Get `filename` property.
      Returns: The filename of the SQLite database where HSTS policies are stored.
  */
  @property string filename() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("filename");
  }

  /**
      Creates a [gid.soup3.hstsenforcer_db.HSTSEnforcerDB].
      
      filename will be read in during the initialization of a
      [gid.soup3.hstsenforcer_db.HSTSEnforcerDB], in order to create an initial set of HSTS
      policies. If the file doesn't exist, a new database will be created
      and initialized. Changes to the policies during the lifetime of a
      [gid.soup3.hstsenforcer_db.HSTSEnforcerDB] will be written to filename when
      [gid.soup3.hstsenforcer.HSTSEnforcer.changed] is emitted.
  
      Params:
        filename = the filename of the database to read/write from.
      Returns: the new #SoupHSTSEnforcer
  */
  this(string filename) nothrow
  {
    SoupHSTSEnforcer* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    _cretval = soup_hsts_enforcer_db_new(_filename);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.soup3.hstsenforcer_db.HSTSEnforcerDB]
class HSTSEnforcerDBGidBuilderImpl(T) : gid.soup3.hstsenforcer.HSTSEnforcerGidBuilderImpl!T
{


  /**
      Set `filename` property.
      Params:
        propval = The filename of the SQLite database where HSTS policies are stored.
      Returns: Builder instance for fluent chaining
  */
  T filename(string propval) nothrow
  {
    return setProperty("filename", propval);
  }
}

/// Fluent builder for [gid.soup3.hstsenforcer_db.HSTSEnforcerDB]
final class HSTSEnforcerDBGidBuilder : HSTSEnforcerDBGidBuilderImpl!HSTSEnforcerDBGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HSTSEnforcerDB build() nothrow
  {
    return new HSTSEnforcerDB(cast(void*)createGObject(HSTSEnforcerDB._getGType), Yes.Take);
  }
}
