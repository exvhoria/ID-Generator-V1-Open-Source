-- Function to generate User ID from the name
function generateUserID(name)
    local userID = ""

    -- Convert each character in the name to ID
    for i = 1, #name do
        local char = name:sub(i, i)
        local charCode = string.byte(char)
        userID = userID .. string.format("%03d", charCode) -- Convert to three-digit number format
    end

    -- Add random letters and numbers with more random placement
    local remainingDigits = 20 - #userID
    local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local shuffledCharacters = shuffleString(characters)
    for i = 1, remainingDigits do
        local randomChar = shuffledCharacters:sub(math.random(#shuffledCharacters), math.random(#shuffledCharacters))
        userID = userID .. randomChar
    end

    return userID
end

-- Function to restore name from User ID
function restoreNameFromUserID(userID)
    local name = ""

    -- Convert each three-digit number in the ID back to character name
    for i = 1, #userID, 3 do
        local charCode = tonumber(userID:sub(i, i + 2))
        if charCode then
            local char = string.char(charCode)
            name = name .. char
        end
    end

    return name
end

-- Function to shuffle a string
function shuffleString(str)
    local shuffled = {}
    for i = 1, #str do
        local randPos = math.random(1, #shuffled + 1)
        table.insert(shuffled, randPos, str:sub(i, i))
    end
    return table.concat(shuffled)
end

-- Function to display animation with custom speed
function animateText(text, delay)
    for i = 1, #text do
        io.write(text:sub(i, i))
        io.flush()
        if text:sub(i, i) == "." then
            os.execute("sleep 0.9")  -- Wait for 0.9 seconds for each "."
        else
            os.execute("sleep " .. delay)  -- Wait for the specified delay
        end
    end
end

-- Display the animation "Making User ID..."
animateText("Making User ID", 0.3)
os.execute("sleep 0.5")  -- Wait for 0.5 seconds
animateText("...\n" , 1.0)
os.execute("sleep 0.5")  -- Wait for0.5 seconds


-- Display the animation "Adding Random Number..."
animateText("Adding Random Number", 0.3)
os.execute("sleep 0.5")  -- Wait for 0.5 seconds
animateText("...\n", 1.0)
os.execute("sleep 0.5")  -- Wait for 0.5 seconds

-- Display the animation for "Adding Random Letter..."
animateText("Adding Random Letter", 0.3)
os.execute("sleep 0.5")  -- Wait for 0.5 seconds
animateText("...\n" , 1.0)
os.execute("sleep 0.5")  -- Wait for 0.5 seconds

-- Display "Done!" message
print("Done!\n\n")

-- Example usage
local name = "Gavin"  --Put Name Here
local userID = generateUserID(name)
print("'Name > User ID':\n", userID)

-- Display the animation "Restoring Name from User ID..."
animateText("\n,Getting User ID > Name, File", 0.3)
os.execute("sleep 0.5")  -- Wait for 0.5 seconds
animateText("...\n\n" , 1.0)
os.execute("sleep 0.5")  -- Wait for 0.5 seconds

local restoredName = restoreNameFromUserID(userID)
print("'User ID > Name':\n", restoredName)
print("\nMade by Mv Bot")  --Change to Whatever You Want
print("Dev by Voiden and GhosttedCodm")  -- Change to Your Name
-- This will get update if im not lazy
