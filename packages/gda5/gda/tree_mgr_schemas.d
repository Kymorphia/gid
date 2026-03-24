/// Module for [TreeMgrSchemas] class
module gda.tree_mgr_schemas;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.meta_store;
import gda.tree_manager;
import gda.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class TreeMgrSchemas : gda.tree_manager.TreeManager
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
    return cast(void function())gda_tree_mgr_schemas_get_type != &gidSymbolNotFound ? gda_tree_mgr_schemas_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeMgrSchemas self()
  {
    return this;
  }

  /**
  Get builder for [gda.tree_mgr_schemas.TreeMgrSchemas]
  Returns: New builder object
  */
  static TreeMgrSchemasGidBuilder builder()
  {
    return new TreeMgrSchemasGidBuilder;
  }

  /**
      Get `connection` property.
      Returns: Defines the #GdaConnection to display information for. Necessary upon construction unless
        the #GdaTreeMgrSchema:meta-store property is specified instead.
  */
  @property gda.connection.Connection connection()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.connection.Connection)("connection");
  }

  /**
      Get `metaStore` property.
      Returns: Defines the #GdaMetaStore to extract information from. Necessary upon construction unless
        the #GdaTreeMgrSchema:connection property is specified instead. This property has
        priority over the GdaTreeMgrSchema:connection property.
  */
  @property gda.meta_store.MetaStore metaStore()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.meta_store.MetaStore)("meta-store");
  }

  /**
      Creates a new #GdaTreeManager object which will add one tree node for each database schema found
      in cnc.
  
      Params:
        cnc = a #GdaConnection object
      Returns: a new #GdaTreeManager object
  */
  this(gda.connection.Connection cnc)
  {
    GdaTreeManager* _cretval;
    _cretval = gda_tree_mgr_schemas_new(cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

class TreeMgrSchemasGidBuilderImpl(T) : gda.tree_manager.TreeManagerGidBuilderImpl!T
{

  /**
      Set `connection` property.
      Params:
        propval = Defines the #GdaConnection to display information for. Necessary upon construction unless
          the #GdaTreeMgrSchema:meta-store property is specified instead.
      Returns: Builder instance for fluent chaining
  */
  T connection(gda.connection.Connection propval)
  {
    return setProperty("connection", propval);
  }

  /**
      Set `metaStore` property.
      Params:
        propval = Defines the #GdaMetaStore to extract information from. Necessary upon construction unless
          the #GdaTreeMgrSchema:connection property is specified instead. This property has
          priority over the GdaTreeMgrSchema:connection property.
      Returns: Builder instance for fluent chaining
  */
  T metaStore(gda.meta_store.MetaStore propval)
  {
    return setProperty("meta-store", propval);
  }
}

/// Fluent builder for [gda.tree_mgr_schemas.TreeMgrSchemas]
final class TreeMgrSchemasGidBuilder : TreeMgrSchemasGidBuilderImpl!TreeMgrSchemasGidBuilder
{
  TreeMgrSchemas build()
  {
    return new TreeMgrSchemas(cast(void*)createGObject(TreeMgrSchemas._getGType), Yes.Take);
  }
}
