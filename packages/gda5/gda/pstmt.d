/// Module for [PStmt] class
module gda.pstmt;

import gda.c.functions;
import gda.c.types;
import gda.statement;
import gda.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class PStmt : gobject.object.ObjectWrap
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
    return cast(void function())gda_pstmt_get_type != &gidSymbolNotFound ? gda_pstmt_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PStmt self()
  {
    return this;
  }

  /**
      Get builder for [gda.pstmt.PStmt]
      Returns: New builder object
  */
  static PStmtGidBuilder builder()
  {
    return new PStmtGidBuilder;
  }

  /**
      Copies src's data to dest
  
      Params:
        dest = a #GdaPStmt object
  */
  void copyContents(gda.pstmt.PStmt dest)
  {
    gda_pstmt_copy_contents(cast(GdaPStmt*)this._cPtr, dest ? cast(GdaPStmt*)dest._cPtr(No.Dup) : null);
  }

  /**
      Get a pointer to the #GdaStatement which led to the creation of this prepared statement.
      
      Note: if that statement has been modified since the creation of pstmt, then this method
      will return null
      Returns: the #GdaStatement
  */
  gda.statement.Statement getGdaStatement()
  {
    GdaStatement* _cretval;
    _cretval = gda_pstmt_get_gda_statement(cast(GdaPStmt*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.statement.Statement)(cast(GdaStatement*)_cretval, No.Take);
    return _retval;
  }

  /**
      Informs pstmt that it corresponds to the preparation of the stmt statement
  
      Params:
        stmt = a #GdaStatement object, or null
  */
  void setGdaStatement(gda.statement.Statement stmt = null)
  {
    gda_pstmt_set_gda_statement(cast(GdaPStmt*)this._cPtr, stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gda.pstmt.PStmt]
class PStmtGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gda.pstmt.PStmt]
final class PStmtGidBuilder : PStmtGidBuilderImpl!PStmtGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PStmt build()
  {
    return new PStmt(cast(void*)createGObject(PStmt._getGType), No.Take);
  }
}
