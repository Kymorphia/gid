/// Module for [FileChooserWidgetAccessible] class
module gid.gtk3.file_chooser_widget_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.object;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
@gidGir("FileChooserWidgetAccessible", "FileChooserWidgetAccessibleClass")
class FileChooserWidgetAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.action.Action
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
    return cast(void function())gtk_file_chooser_widget_accessible_get_type != &gidSymbolNotFound ? gtk_file_chooser_widget_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFileChooserWidgetAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileChooserWidgetAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.file_chooser_widget_accessible.FileChooserWidgetAccessible]
      Returns: New builder object
  */
  static FileChooserWidgetAccessibleGidBuilder builder() nothrow
  {
    return new FileChooserWidgetAccessibleGidBuilder;
  }

  mixin ActionT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gid.gtk3.file_chooser_widget_accessible.FileChooserWidgetAccessible]
class FileChooserWidgetAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.file_chooser_widget_accessible.FileChooserWidgetAccessible]
final class FileChooserWidgetAccessibleGidBuilder : FileChooserWidgetAccessibleGidBuilderImpl!FileChooserWidgetAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileChooserWidgetAccessible build() nothrow
  {
    return new FileChooserWidgetAccessible(cast(void*)createGObject(FileChooserWidgetAccessible._getGType), Yes.Take);
  }
}
