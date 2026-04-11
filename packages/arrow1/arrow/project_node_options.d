/// Module for [ProjectNodeOptions] class
module arrow.project_node_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.expression;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class ProjectNodeOptions : arrow.execute_node_options.ExecuteNodeOptions
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
    return cast(void function())garrow_project_node_options_get_type != &gidSymbolNotFound ? garrow_project_node_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ProjectNodeOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrow.project_node_options.ProjectNodeOptions]
      Returns: New builder object
  */
  static ProjectNodeOptionsGidBuilder builder()
  {
    return new ProjectNodeOptionsGidBuilder;
  }

  /** */
  this(arrow.expression.Expression[] expressions, string[] names = null)
  {
    GArrowProjectNodeOptions* _cretval;
    auto _expressions = gListFromD!(arrow.expression.Expression)(expressions);
    scope(exit) containerFree!(GList*, arrow.expression.Expression, GidOwnership.None)(_expressions);
    size_t _nNames;
    if (names)
      _nNames = cast(size_t)names.length;

    char*[] _tmpnames;
    foreach (s; names)
      _tmpnames ~= s.toCString(No.Alloc);
    char** _names = _tmpnames.ptr;

    _cretval = garrow_project_node_options_new(_expressions, _names, _nNames);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.project_node_options.ProjectNodeOptions]
class ProjectNodeOptionsGidBuilderImpl(T) : arrow.execute_node_options.ExecuteNodeOptionsGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.project_node_options.ProjectNodeOptions]
final class ProjectNodeOptionsGidBuilder : ProjectNodeOptionsGidBuilderImpl!ProjectNodeOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ProjectNodeOptions build()
  {
    return new ProjectNodeOptions(cast(void*)createGObject(ProjectNodeOptions._getGType), Yes.Take);
  }
}
