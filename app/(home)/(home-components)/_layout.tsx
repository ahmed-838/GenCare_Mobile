import { Stack } from 'expo-router';

export default function HomeComponentsLayout() {
  return (
    <Stack screenOptions={{ headerShown: false }}>
      <Stack.Screen name="upper-swiper" />
      <Stack.Screen name="weeks-list" />
      <Stack.Screen name="diseases-list" />
      <Stack.Screen name="baby-names" />
      <Stack.Screen name="ai-page" />
    </Stack>
  );
}