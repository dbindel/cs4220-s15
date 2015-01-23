def g(x):
    """Test function"""
    return (x+1) ** 0.125 * (x-1) - 0.1


def gp(x):
    """Derivative of g(x)"""
    return (x+1) ** -0.875 * (x-1)/8 + (x+1) ** 0.125


def newtong(x0, g, gp, monitor=None, nsteps=8):
    """Simple Newton solver

    This solver takes a fixed number of steps and calls the
    monitor(k, x, dx, gx) function at each iteration in order
    to monitor convergence.

    Args:
        x0: Initial guess
        g(x): Function
        gp(x): Derivative of g
        monitor: Callback for convergence monitoring (default: None)
        nsteps: Number of steps to take (default: 8)
    """
    x = x0
    for k in range(nsteps):
        gx = g(x)
        dx = gx/gp(x)
        if monitor is not None:
            monitor(k, x, dx, gx)
        x = x-dx


if __name__ == "__main__":
    with open("newtong.dat", "w") as f:
        def monitor(k, x, dx, gx):
            f.write("{0} {1} {2}\n".format(k, dx, gx))

        f.write("k g dx\n")
        newtong(1, g, gp, monitor)
