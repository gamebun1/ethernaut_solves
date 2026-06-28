solve for Privacy task

## Step 1:
go to bytecode decompiler and decompile contract.
```
# Palkeoramix decompiler. 

def storage:
  stor0 is uint8 at storage 0
  ID is uint256 at storage 1
  stor5 is uint256 at storage 5

def ID() payable: 
  return ID

def locked() payable: 
  return bool(stor0)

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def unlock(bytes16 _param1) payable: 
  require calldata.size - 4 >=′ 32
  require _param1 == Mask(128, 128, _param1)
  require Mask(128, 128, stor5) == Mask(128, 128, _param1)
  stor0 = 0
```
stor5 is second element of `data` array.

## Step 2:
receive 5 storage of contract in web console
```
a = await web3.eth.getStorageAt(instance, 5)
```

## Step 3:
convert Hex from storage to array and slice it to first 16 bytes(bytes16() select left 16 bytes).
```
b = web3.utils.hexToBytes(a).slice(0,16) 
```

## Step 4:
convert sliced array to Hex.
```
c = web3.utils.bytesToHex(c)
```

## Step 5:
Send key and solve the challnge
```
await contract.unlock(c)
```

Congratulations!!!