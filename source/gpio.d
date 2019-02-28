module dpigpio.gpio;

import std.conv;

private extern int gpioSetMode(uint gpio, uint mode);

enum Mode
{
	INPUT = 0,
	OUTPUT = 1,
	ALT0 = 4,
	ALT1 = 5,
	ALT2 = 6,
	ALT3 = 7,
	ALT4 = 3,
	ALT5 = 2
}

alias Gpio = uint;

void setMode(Gpio gpio, Mode mode)
{
	switch (gpioSetMode(gpio, mode))
	{
	case 0:
		return;
	case -3:
		throw new BadGpioException("Bad gpio " ~ gpio.to!string);
	case -4:
		throw new BadModeException("Bad mode " ~ mode.to!string ~ " for gpio " ~ gpio.to!string);
	default:
		throw new Exception("Could not set mode for gpio " ~ gpio.to!string);
	}
}

class BadGpioException : Exception
{
	this(string message)
	{
		super(message);
	}
}

class BadModeException : Exception
{
	this(string message)
	{
		super(message);
	}
}
