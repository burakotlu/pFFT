import numpy as np
import matplotlib.pyplot as plt

# Read data
x = np.loadtxt("tailorsinDouble.txt")
y = np.loadtxt("sinPosit.txt")
z = np.loadtxt("tailorsinFloat.txt")
# Plot x and y on the same axis
plt.plot(x, label="Approximate Tailor ", color="blue")
plt.plot(y, label="Posit", color="green")
plt.plot(z, label="Tailor", color="red")

plt.title("Sin 2 term   Approximate Tailor vs Tailor [-4pi 4pi]")
plt.legend()
plt.grid(True)
plt.show()