/// Module for [TreeMgrColumns] class
module gda.tree_mgr_columns;

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
class TreeMgrColumns : gda.tree_manager.TreeManager
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
    return cast(void function())gda_tree_mgr_columns_get_type != &gidSymbolNotFound ? gda_tree_mgr_columns_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeMgrColumns self()
  {
    return this;
  }

  /**
  Get builder for [gda.tree_mgr_columns.TreeMgrColumns]
  Returns: New builder object
  */
  static TreeMgrColumnsGidBuilder builder()
  {
    return new TreeMgrColumnsGidBuilder;
  }

  /**
      Get `connection` property.
      Returns: Defines the #GdaConnection to display information for. Necessary upon construction unless
        the #GdaTreeMgrColumns:meta-store property is specified instead.
  */
  @property gda.connection.Connection connection()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.connection.Connection)("connection");
  }

  /**
      Get `metaStore` property.
      Returns: Defines the #GdaMetaStore to extract information from. Necessary upon construction unless
        the #GdaTreeMgrColumns:connection property is specified instead. This property has
        priority over the GdaTreeMgrColumns:connection property.
  */
  @property gda.meta_store.MetaStore metaStore()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.meta_store.MetaStore)("meta-store");
  }

  /**
      Creates a new #GdaTreeManager object which will add one tree node for each
      column in the table named table_name in the schema schema.
  
      Params:
        cnc = a #GdaConnection object
        schema = a schema name
        tableName = the name of the table
      Returns: a new #GdaTreeManager object
  */
  this(gda.connection.Connection cnc, string schema, string tableName)
  {
    GdaTreeManager* _cretval;
    const(char)* _schema = schema.toCString(No.Alloc);
    const(char)* _tableName = tableName.toCString(No.Alloc);
    _cretval = gda_tree_mgr_columns_new(cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _schema, _tableName);
    this(_cretval, Yes.Take);
  }
}

class TreeMgrColumnsGidBuilderImpl(T) : gda.tree_manager.TreeManagerGidBuilderImpl!T
{

  /**
      Set `connection` property.
      Params:
        propval = Defines the #GdaConnection to display information for. Necessary upon construction unless
          the #GdaTreeMgrColumns:meta-store property is specified instead.
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
          the #GdaTreeMgrColumns:connection property is specified instead. This property has
          priority over the GdaTreeMgrColumns:connection property.
      Returns: Builder instance for fluent chaining
  */
  T metaStore(gda.meta_store.MetaStore propval)
  {
    return setProperty("meta-store", propval);
  }

  /**
      Set `schema` property.
      Params:
        propval = If no set, then the table name will be fetched from the parent node using the "schema" attribute
      Returns: Builder instance for fluent chaining
  */
  T schema(string propval)
  {
    return setProperty("schema", propval);
  }

  /**
      Set `tableName` property.
      Params:
        propval = If no set, then the table name will be fetched from the parent node using the "table_name" attribute
      Returns: Builder instance for fluent chaining
  */
  T tableName(string propval)
  {
    return setProperty("table-name", propval);
  }
}

/// Fluent builder for [gda.tree_mgr_columns.TreeMgrColumns]
final class TreeMgrColumnsGidBuilder : TreeMgrColumnsGidBuilderImpl!TreeMgrColumnsGidBuilder
{
  TreeMgrColumns build()
  {
    return new TreeMgrColumns(cast(void*)createGObject(TreeMgrColumns._getGType), Yes.Take);
  }
}
