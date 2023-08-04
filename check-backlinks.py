import os

def update_markdown_files():
    # Step 1: Get a list of all markdown files in the current directory, excluding 'index.md'
    markdown_files = [file for file in os.listdir('.') if file.endswith('.md') and file != 'index.md']

    # Step 2 and Step 3: Process each markdown file
    for file in markdown_files:
        with open(file, 'r') as f:
            lines = f.readlines()

        # Check if the file is empty or contains only one line (no second to last line)
        if len(lines) < 2:
            with open(file, 'a') as f:
                f.write(f'Return to [Index](index.html)\n')
        else:
            second_to_last_line = lines[-1].strip()

            # Step 4: If the second to last line is not as expected, append it to the file
            if second_to_last_line != 'Return to [Index](index.html)':
                with open(file, 'a') as f:
                    f.write(f'\nReturn to [Index](index.html)\n')

if __name__ == "__main__":
    update_markdown_files()
