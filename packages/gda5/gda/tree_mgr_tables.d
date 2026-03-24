/// Module for [TreeMgrTables] class
module gda.tree_mgr_tables;

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
class TreeMgrTables : gda.tree_manager.TreeManager
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
    return cast(void function())gda_tree_mgr_tables_get_type != &gidSymbolNotFound ? gda_tree_mgr_tables_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeMgrTables self()
  {
    return this;
  }

  /**
  Get builder for [gda.tree_mgr_tables.TreeMgrTables]
  Returns: New builder object
  */
  static TreeMgrTablesGidBuilder builder()
  {
    return new TreeMgrTablesGidBuilder;
  }

  /**
      Get `connection` property.
      Returns: Defines the #GdaConnection to display information for. Necessary upon construction unless
        the #GdaTreeMgrTables:meta-store property is specified instead.
  */
  @property gda.connection.Connection connection()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.connection.Connection)("connection");
  }

  /**
      Get `metaStore` property.
      Returns: Defines the #GdaMetaStore to extract information from. Necessary upon construction unless
        the #GdaTreeMgrTables:connection property is specified instead. This property has
        priority over the GdaTreeMgrTables:connection property.
  */
  @property gda.meta_store.MetaStore metaStore()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.meta_store.MetaStore)("meta-store");
  }

  /**
      Creates a new #GdaTreeManager object which will add one tree node for each table found in the
      schema if it is not null, or for each table visible by default in cnc.
  
      Params:
        cnc = a #GdaConnection object
        schema = a schema name or null
      Returns: a new #GdaTreeManager object
  */
  this(gda.connection.Connection cnc, string schema = null)
  {
    GdaTreeManager* _cretval;
    const(char)* _schema = schema.toCString(No.Alloc);
    _cretval = gda_tree_mgr_tables_new(cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _schema);
    this(_cretval, Yes.Take);
  }
}

class TreeMgrTablesGidBuilderImpl(T) : gda.tree_manager.TreeManagerGidBuilderImpl!T
{

  /**
      Set `connection` property.
      Params:
        propval = Defines the #GdaConnection to display information for. Necessary upon construction unless
          the #GdaTreeMgrTables:meta-store property is specified instead.
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
          the #GdaTreeMgrTables:connection property is specified instead. This property has
          priority over the GdaTreeMgrTables:connection property.
      Returns: Builder instance for fluent chaining
  */
  T metaStore(gda.meta_store.MetaStore propval)
  {
    return setProperty("meta-store", propval);
  }

  /**
      Set `schema` property.
      Params:
        propval = If no set, then the table name will be fetched from the parent node using the "schema" attribute. If not
          found that way, then the list of visible tables (tables which can be identified without having to specify
          a schema) will be used
      Returns: Builder instance for fluent chaining
  */
  T schema(string propval)
  {
    return setProperty("schema", propval);
  }
}

/// Fluent builder for [gda.tree_mgr_tables.TreeMgrTables]
final class TreeMgrTablesGidBuilder : TreeMgrTablesGidBuilderImpl!TreeMgrTablesGidBuilder
{
  TreeMgrTables build()
  {
    return new TreeMgrTables(cast(void*)createGObject(TreeMgrTables._getGType), Yes.Take);
  }
}
