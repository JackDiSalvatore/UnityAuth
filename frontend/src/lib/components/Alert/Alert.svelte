<script lang="ts">
	import { Alert, Button } from 'stwui';
	import { informationCircle } from '$lib/components/Svg/solid/informationCircle';
	import { exclamationTriangle } from '$lib/components/Svg/solid/exclamationTriangle';
	import { exclamationCircle } from '$lib/components/Svg/solid/exclamationCircle';
	import { checkCircle } from '$lib/components/Svg/solid/checkCircle';
	import { ALERT_ANIMATION_DURATION, type AlertType } from '$lib/context/UnityAuthAlertStore';
	import { createEventDispatcher } from 'svelte';
	import { fly } from 'svelte/transition';

	const dispatch = createEventDispatcher<{ close: void }>();

	const typeIconMap = {
		error: exclamationCircle,
		info: informationCircle,
		warn: exclamationTriangle,
		success: checkCircle
	};

	export let type: AlertType;
	export let title: string;
	export let description: string | undefined;
</script>

<div
	in:fly|global={{ y: 200, duration: ALERT_ANIMATION_DURATION }}
	out:fly|global={{ x: 200, duration: ALERT_ANIMATION_DURATION }}
>
	<Alert {type} on:fade>
		<Alert.Leading slot="leading" data={typeIconMap[type]} />
		<Alert.Title slot="title">{title}</Alert.Title>

		<Alert.Description slot="description">
			<!-- todo change back to @html once csp policy is corrected -> https://kit.svelte.dev/docs/configuration#csp -->
			<!-- {@html description} -->
			{description}
		</Alert.Description>

		<Button on:click={() => dispatch('close')} class="ml-3" slot="extra" type="ghost">Close</Button>
	</Alert>
</div>

<style>
	div {
		position: fixed;
		left: 50%;
		bottom: 20px;
		transform: translate(-50%, -50%);
		margin: 0 auto;
		min-width: 15rem;
	}
</style>
