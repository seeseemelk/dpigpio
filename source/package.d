module dpigpio;

private extern int gpioInitialise();
private extern void gpioTerminate();

/**
 * Initialises the library.
 * Returns: `true` if the library was initialised correctly, `false` if it wasn't.
 */
bool initialise()
{
	return gpioInitialise() >= 0;
}

/**
 * Terminates the library.
 */
void terminate()
{
	gpioTerminate();
}
