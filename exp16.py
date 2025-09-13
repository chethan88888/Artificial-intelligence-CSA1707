import numpy as np

# Activation function (sigmoid) and derivative
def sigmoid(x):
    return 1 / (1 + np.exp(-x))

def sigmoid_derivative(x):
    return x * (1 - x)

# Input dataset (XOR problem)
X = np.array([[0,0],
              [0,1],
              [1,0],
              [1,1]])

# Output labels
y = np.array([[0],[1],[1],[0]])

# Initialize weights and biases
np.random.seed(42)
input_layer_neurons = 2
hidden_layer_neurons = 2
output_neurons = 1

W1 = np.random.uniform(size=(input_layer_neurons, hidden_layer_neurons))
B1 = np.random.uniform(size=(1, hidden_layer_neurons))
W2 = np.random.uniform(size=(hidden_layer_neurons, output_neurons))
B2 = np.random.uniform(size=(1, output_neurons))

# Training parameters
epochs = 10000
learning_rate = 0.1

# Training loop
for _ in range(epochs):
    # Forward pass
    hidden_input = np.dot(X, W1) + B1
    hidden_output = sigmoid(hidden_input)
    final_input = np.dot(hidden_output, W2) + B2
    final_output = sigmoid(final_input)

    # Error
    error = y - final_output

    # Backpropagation
    d_output = error * sigmoid_derivative(final_output)
    error_hidden = d_output.dot(W2.T)
    d_hidden = error_hidden * sigmoid_derivative(hidden_output)

    # Update weights and biases
    W2 += hidden_output.T.dot(d_output) * learning_rate
    B2 += np.sum(d_output, axis=0, keepdims=True) * learning_rate
    W1 += X.T.dot(d_hidden) * learning_rate
    B1 += np.sum(d_hidden, axis=0, keepdims=True) * learning_rate

# Final predictions
print("Final Output after Training:\n", final_output)
