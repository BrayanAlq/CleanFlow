import { ThemedView } from '@/components/themed-view'
import { useTheme } from '@/hooks/use-theme'
import { Ionicons } from '@expo/vector-icons'
import { useState } from 'react'
import { StyleSheet, TextInput, TouchableOpacity } from 'react-native'

interface IPasswordInputProps {
  value: string
  onChangeValue: (text: string) => void
  placeholder: string
  pattern?: RegExp
  areSameStringPassword?: boolean
}

export const ThemedPasswordInput = ({
  value,
  onChangeValue,
  placeholder,
  pattern,
  areSameStringPassword,
}: IPasswordInputProps) => {
  const [showPassword, setShowPassword] = useState(false)
  const theme = useTheme()

  const isValid = pattern ? pattern.test(value) : true
  const isError = value.length > 0 && !isValid
  const borderColor =
    isError || areSameStringPassword === false
      ? theme.borderError
      : theme.borderColor

  return (
    <ThemedView
      style={[
        styles.passRow,
        {
          borderWidth: 1,
          borderColor,
        },
      ]}
    >
      <TextInput
        style={[
          styles.passInput,
          {
            backgroundColor: theme.background,
            color: theme.text,
          },
        ]}
        placeholder={placeholder}
        placeholderTextColor={theme.text}
        value={value}
        onChangeText={text => onChangeValue(text)}
        secureTextEntry={!showPassword}
      />
      <TouchableOpacity
        style={styles.eyeBtn}
        onPress={() => setShowPassword(prev => !prev)}
      >
        <Ionicons
          name={showPassword ? 'eye-outline' : 'eye-off-outline'}
          size={22}
          color='#888'
        />
      </TouchableOpacity>
    </ThemedView>
  )
}

const styles = StyleSheet.create({
  passRow: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 14,
    marginBottom: 12,
    elevation: 1,
    shadowColor: '#000',
    shadowOpacity: 0.03,
    shadowRadius: 3,
    shadowOffset: { width: 0, height: 1 },
  },
  passInput: {
    flex: 1,
    padding: 14,
    fontSize: 16,
    borderRadius: 14,
  },
  eyeBtn: { paddingHorizontal: 14 },
})
