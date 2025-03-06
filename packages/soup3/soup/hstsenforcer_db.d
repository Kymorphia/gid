module soup.hstsenforcer_db;

import gid.gid;
import soup.c.functions;
import soup.c.types;
import soup.hstsenforcer;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
    Persistent HTTP Strict Transport Security enforcer.
  
  #SoupHSTSEnforcerDB is a `class@HSTSEnforcer` that uses a SQLite
  database as a backend for persistency.
*/
class HSTSEnforcerDB : soup.hstsenforcer.HSTSEnforcer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_hsts_enforcer_db_get_type != &gidSymbolNotFound ? soup_hsts_enforcer_db_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Creates a #SoupHSTSEnforcerDB.
    
    filename will be read in during the initialization of a
    #SoupHSTSEnforcerDB, in order to create an initial set of HSTS
    policies. If the file doesn't exist, a new database will be created
    and initialized. Changes to the policies during the lifetime of a
    #SoupHSTSEnforcerDB will be written to filename when
    `signalHSTSEnforcer::changed` is emitted.
    Params:
      filename =       the filename of the database to read/write from.
    Returns:     the new #SoupHSTSEnforcer
  */
  this(string filename)
  {
    SoupHSTSEnforcer* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = soup_hsts_enforcer_db_new(_filename);
    this(_cretval, Yes.Take);
  }
}
