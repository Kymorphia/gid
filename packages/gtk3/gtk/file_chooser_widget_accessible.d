/// Module for [FileChooserWidgetAccessible] class
module gtk.file_chooser_widget_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.object;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class FileChooserWidgetAccessible : gtk.container_accessible.ContainerAccessible, atk.action.Action
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
    return cast(void function())gtk_file_chooser_widget_accessible_get_type != &gidSymbolNotFound ? gtk_file_chooser_widget_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileChooserWidgetAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.file_chooser_widget_accessible.FileChooserWidgetAccessible]
  Returns: New builder object
  */
  static FileChooserWidgetAccessibleGidBuilder builder()
  {
    return new FileChooserWidgetAccessibleGidBuilder;
  }

  mixin ActionT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;
}

class FileChooserWidgetAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.action.ActionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
}

/// Fluent builder for [gtk.file_chooser_widget_accessible.FileChooserWidgetAccessible]
final class FileChooserWidgetAccessibleGidBuilder : FileChooserWidgetAccessibleGidBuilderImpl!FileChooserWidgetAccessibleGidBuilder
{
  FileChooserWidgetAccessible build()
  {
    return new FileChooserWidgetAccessible(cast(void*)createGObject(FileChooserWidgetAccessible._getGType), No.Take);
  }
}
