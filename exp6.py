def vacuum_cleaner():
    # Take input for room status
    room = {}
    room['A'] = input("Enter status of Room A (Clean/Dirty): ")
    room['B'] = input("Enter status of Room B (Clean/Dirty): ")

    # Start in Room A
    current = 'A'

    print("\nInitial Room Status:", room)

    # Process until both rooms are clean
    for _ in range(2):  
        if room[current] == "Dirty":
            print(f"Vacuum in Room {current}: Cleaning...")
            room[current] = "Clean"
        else:
            print(f"Vacuum in Room {current}: Already clean")

        # Move to other room
        current = 'B' if current == 'A' else 'A'

    print("\nFinal Room Status:", room)


# Run program
vacuum_cleaner()
