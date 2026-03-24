/// Module for [CommandDescriptor] class
module arrowflight.command_descriptor;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.descriptor;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;

/** */
class CommandDescriptor : arrowflight.descriptor.Descriptor
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
    return cast(void function())gaflight_command_descriptor_get_type != &gidSymbolNotFound ? gaflight_command_descriptor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CommandDescriptor self()
  {
    return this;
  }

  /**
  Get builder for [arrowflight.command_descriptor.CommandDescriptor]
  Returns: New builder object
  */
  static CommandDescriptorGidBuilder builder()
  {
    return new CommandDescriptorGidBuilder;
  }

  /** */
  this(string command)
  {
    GAFlightCommandDescriptor* _cretval;
    const(char)* _command = command.toCString(No.Alloc);
    _cretval = gaflight_command_descriptor_new(_command);
    this(_cretval, Yes.Take);
  }

  /** */
  string getCommand()
  {
    char* _cretval;
    _cretval = gaflight_command_descriptor_get_command(cast(GAFlightCommandDescriptor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

class CommandDescriptorGidBuilderImpl(T) : arrowflight.descriptor.DescriptorGidBuilderImpl!T
{
}

/// Fluent builder for [arrowflight.command_descriptor.CommandDescriptor]
final class CommandDescriptorGidBuilder : CommandDescriptorGidBuilderImpl!CommandDescriptorGidBuilder
{
  CommandDescriptor build()
  {
    return new CommandDescriptor(cast(void*)createGObject(CommandDescriptor._getGType), Yes.Take);
  }
}
