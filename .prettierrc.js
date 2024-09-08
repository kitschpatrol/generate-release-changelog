import sharedConfig from '@kitschpatrol/prettier-config'

/** @type {import("prettier").Config} */
const localConfig = {
	// Config overrides
	overrides: [
		...sharedConfig.overrides,
		{
			files: '*.sh',
			options: {
				useTabs: false,
			},
		},
		{
			files: ['*.md'],
			options: {
				singleQuote: false,
			},
		},
	],
}
export default {
	...sharedConfig,
	...localConfig,
}
