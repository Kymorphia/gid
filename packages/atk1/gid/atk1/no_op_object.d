/// Module for [NoOpObject] class
module gid.atk1.no_op_object;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.document;
import gid.atk1.document_mixin;
import gid.atk1.editable_text;
import gid.atk1.editable_text_mixin;
import gid.atk1.hypertext;
import gid.atk1.hypertext_mixin;
import gid.atk1.image;
import gid.atk1.image_mixin;
import gid.atk1.object;
import gid.atk1.selection;
import gid.atk1.selection_mixin;
import gid.atk1.table;
import gid.atk1.table_cell;
import gid.atk1.table_cell_mixin;
import gid.atk1.table_mixin;
import gid.atk1.text;
import gid.atk1.text_mixin;
import gid.atk1.types;
import gid.atk1.value;
import gid.atk1.value_mixin;
import gid.atk1.window;
import gid.atk1.window_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    An AtkObject which purports to implement all ATK interfaces.
    
    An AtkNoOpObject is an AtkObject which purports to implement all
    ATK interfaces. It is the type of AtkObject which is created if an
    accessible object is requested for an object type for which no
    factory type is specified.
*/
class NoOpObject : gid.atk1.object.ObjectWrap, gid.atk1.action.Action, gid.atk1.component.Component, gid.atk1.document.Document, gid.atk1.editable_text.EditableText, gid.atk1.hypertext.Hypertext, gid.atk1.image.Image, gid.atk1.selection.Selection, gid.atk1.table.Table, gid.atk1.table_cell.TableCell, gid.atk1.text.Text, gid.atk1.value.Value, gid.atk1.window.Window
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())atk_no_op_object_get_type != &gidSymbolNotFound ? atk_no_op_object_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkNoOpObject";
  }

  /** Returns `this`, for use in `with` statements. */
  override NoOpObject self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.no_op_object.NoOpObject]
      Returns: New builder object
  */
  static NoOpObjectGidBuilder builder() nothrow
  {
    return new NoOpObjectGidBuilder;
  }

  mixin ActionT!();
  mixin ComponentT!();
  mixin DocumentT!();
  mixin EditableTextT!();
  mixin HypertextT!();
  mixin ImageT!();
  mixin SelectionT!();
  mixin TableT!();
  mixin TableCellT!();
  mixin TextT!();
  mixin ValueT!();
  mixin WindowT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;

  /**
      Provides a default (non-functioning stub) #AtkObject.
      Application maintainers should not use this method.
  
      Params:
        obj = a #GObject
      Returns: a default (non-functioning stub) #AtkObject
  */
  this(gid.gobject2.object.ObjectWrap obj) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      AtkObject* _cretval;
      _cretval = atk_no_op_object_new(obj ? cast(GObject*)obj._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.no_op_object.NoOpObject]
class NoOpObjectGidBuilderImpl(T) : gid.atk1.object.ObjectWrapGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T, gid.atk1.component.ComponentGidBuilderImpl!T, gid.atk1.document.DocumentGidBuilderImpl!T, gid.atk1.editable_text.EditableTextGidBuilderImpl!T, gid.atk1.hypertext.HypertextGidBuilderImpl!T, gid.atk1.image.ImageGidBuilderImpl!T, gid.atk1.selection.SelectionGidBuilderImpl!T, gid.atk1.table.TableGidBuilderImpl!T, gid.atk1.table_cell.TableCellGidBuilderImpl!T, gid.atk1.text.TextGidBuilderImpl!T, gid.atk1.value.ValueGidBuilderImpl!T, gid.atk1.window.WindowGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin ComponentGidBuilderT!();
  mixin DocumentGidBuilderT!();
  mixin EditableTextGidBuilderT!();
  mixin HypertextGidBuilderT!();
  mixin ImageGidBuilderT!();
  mixin SelectionGidBuilderT!();
  mixin TableGidBuilderT!();
  mixin TableCellGidBuilderT!();
  mixin TextGidBuilderT!();
  mixin ValueGidBuilderT!();
  mixin WindowGidBuilderT!();
}

/// Fluent builder for [gid.atk1.no_op_object.NoOpObject]
final class NoOpObjectGidBuilder : NoOpObjectGidBuilderImpl!NoOpObjectGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NoOpObject build() nothrow
  {
    return new NoOpObject(cast(void*)createGObject(NoOpObject._getGType), Yes.Take);
  }
}
