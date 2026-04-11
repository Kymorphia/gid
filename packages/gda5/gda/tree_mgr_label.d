/// Module for [TreeMgrLabel] class
module gda.tree_mgr_label;

import gda.c.functions;
import gda.c.types;
import gda.tree_manager;
import gda.types;
import gid.gid;
import gobject.gid_builder;

/** */
class TreeMgrLabel : gda.tree_manager.TreeManager
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
    return cast(void function())gda_tree_mgr_label_get_type != &gidSymbolNotFound ? gda_tree_mgr_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeMgrLabel self()
  {
    return this;
  }

  /**
      Get builder for [gda.tree_mgr_label.TreeMgrLabel]
      Returns: New builder object
  */
  static TreeMgrLabelGidBuilder builder()
  {
    return new TreeMgrLabelGidBuilder;
  }

  /**
      Creates a new #GdaTreeManager object which will add one tree node labelled label
  
      Params:
        label = a label string
      Returns: a new #GdaTreeManager object
  */
  this(string label)
  {
    GdaTreeManager* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gda_tree_mgr_label_new(_label);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gda.tree_mgr_label.TreeMgrLabel]
class TreeMgrLabelGidBuilderImpl(T) : gda.tree_manager.TreeManagerGidBuilderImpl!T
{

  /** */
  T label(string propval)
  {
    return setProperty("label", propval);
  }
}

/// Fluent builder for [gda.tree_mgr_label.TreeMgrLabel]
final class TreeMgrLabelGidBuilder : TreeMgrLabelGidBuilderImpl!TreeMgrLabelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeMgrLabel build()
  {
    return new TreeMgrLabel(cast(void*)createGObject(TreeMgrLabel._getGType), Yes.Take);
  }
}
