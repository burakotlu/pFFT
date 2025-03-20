import numpy as np
import matplotlib.pyplot as plt

# Read data
x = np.loadtxt("tailorcosDouble.txt")
y = np.loadtxt("cosPosit.txt")
z = np.loadtxt("tailorcosFloat.txt")
# Plot x and y on the same axis
plt.plot(x, label="Double", color="blue")
plt.plot(y, label="Posit", color="green")
plt.plot(z, label="Float", color="red")

plt.title("Cos 4 term   Approximate Tailor vs Tailor [-4pi 4pi]")
plt.legend()
plt.grid(True)
plt.show()