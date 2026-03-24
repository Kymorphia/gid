/// Module for [ListItemFactory] class
module gtk.list_item_factory;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A [gtk.list_item_factory.ListItemFactory] creates widgets for the items taken from a [gio.list_model.ListModel].
    
    This is one of the core concepts of handling list widgets such
    as [gtk.list_view.ListView] or [gtk.grid_view.GridView].
    
    The [gtk.list_item_factory.ListItemFactory] is tasked with creating widgets for items
    taken from the model when the views need them and updating them as
    the items displayed by the view change.
    
    A view is usually only able to display anything after both a factory
    and a model have been set on the view. So it is important that you do
    not skip this step when setting up your first view.
    
    Because views do not display the whole list at once but only a few
    items, they only need to maintain a few widgets at a time. They will
    instruct the [gtk.list_item_factory.ListItemFactory] to create these widgets and bind them
    to the items that are currently displayed.
    
    As the list model changes or the user scrolls to the list, the items will
    change and the view will instruct the factory to bind the widgets to those
    new items.
    
    The actual widgets used for displaying those widgets is provided by you.
    
    When the factory needs widgets created, it will create a [gtk.list_item.ListItem]
    and hand it to your code to set up a widget for. This list item will provide
    various properties with information about what item to display and provide
    you with some opportunities to configure its behavior. See the
    [gtk.list_item.ListItem] documentation for further details.
    
    Various implementations of [gtk.list_item_factory.ListItemFactory] exist to allow you different
    ways to provide those widgets. The most common implementations are
    [gtk.builder_list_item_factory.BuilderListItemFactory] which takes a [gtk.builder.Builder] .ui file
    and then creates widgets and manages everything automatically from the
    information in that file and [gtk.signal_list_item_factory.SignalListItemFactory] which allows
    you to connect to signals with your own code and retain full control over
    how the widgets are setup and managed.
    
    A [gtk.list_item_factory.ListItemFactory] is supposed to be final - that means its behavior should
    not change and the first widget created from it should behave the same way as
    the last widget created from it.
    If you intend to do changes to the behavior, it is recommended that you create
    a new [gtk.list_item_factory.ListItemFactory] which will allow the views to recreate its widgets.
    
    Once you have chosen your factory and created it, you need to set it
    on the view widget you want to use it with, such as via
    [gtk.list_view.ListView.setFactory]. Reusing factories across different
    views is allowed, but very uncommon.
*/
class ListItemFactory : gobject.object.ObjectWrap
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
    return cast(void function())gtk_list_item_factory_get_type != &gidSymbolNotFound ? gtk_list_item_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListItemFactory self()
  {
    return this;
  }

  /**
  Get builder for [gtk.list_item_factory.ListItemFactory]
  Returns: New builder object
  */
  static ListItemFactoryGidBuilder builder()
  {
    return new ListItemFactoryGidBuilder;
  }
}

class ListItemFactoryGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.list_item_factory.ListItemFactory]
final class ListItemFactoryGidBuilder : ListItemFactoryGidBuilderImpl!ListItemFactoryGidBuilder
{
  ListItemFactory build()
  {
    return new ListItemFactory(cast(void*)createGObject(ListItemFactory._getGType), No.Take);
  }
}
