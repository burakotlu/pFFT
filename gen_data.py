import math

def generate_angles_to_file(input_size):
    filename = f"angle_values_{input_size}.txt"
    
    # Calculate step size
    step_size = 4 * math.pi / input_size
    
    # Generate angles from -2π to 2π with the calculated step size
    angles = [-2 * math.pi + i * step_size for i in range(input_size)]
    
    with open(filename, 'w') as f:
        for angle in angles:
            f.write(f"{angle:.5f}\n")

    print(f"File '{filename}' created with {input_size} angle values.")

# Example usage
generate_angles_to_file(256)