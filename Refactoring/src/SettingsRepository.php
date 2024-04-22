<?php

declare(strict_types=1);

namespace Sharlottte\ItpelagRefactoring;

use Psr\Log\LoggerInterface;

class SettingsRepository extends GlobalSettings
{
    private LoggerInterface $logger;

    private array $settings = [
        'use-yearmonth-folders' => '2',
        'wp-uploads' => '1',
        'copy-to-s3' => '2',
        'serve-from-s3' => '3',
        'object-prefix' => '4',
        'object-versioning' => '1212',
    ];

    private array $options = [
        'key1' => '6',
        'key2' => '5',
        'uploads_use_yearmonth_folders' => '10',
    ];

    public function __construct(LoggerInterface $logger)
    {
        $this->logger = $logger;
    }

    public function get(string $key, mixed $default = ''): mixed
    {
        // If legacy setting set, migrate settings
        if (
            isset($this->settings['wp-uploads'])
            && $this->settings['wp-uploads']
            && in_array($key, ['copy-to-s3', 'serve-from-s3'], true)
        ) {
            return $default;
        }

        // Turn on object versioning by default
        if ('object-versioning' == $key && !isset($this->settings['object-versioning'])) {
            return $default;
        }

        // Default object prefix
        if ('object-prefix' == $key && !isset($this->settings['object-prefix'])) {
            return $this->get_default_object_prefix();
        }

        $this->logger->debug('log message: step 3');

        if ('use-yearmonth-folders' == $key && !isset($this->settings['use-yearmonth-folders'])) {
            return $this->get_option('uploads_use_yearmonth_folders');
        }

        return parent::get($key, $default);
    }

    protected function get_default_object_prefix()
    {
        return 'get_default_object_prefix';
    }

    protected function get_option($key)
    {
        $re = $this->options[$key] ?? 'default';

        $this->logger->debug($re);

        return $re;
    }
}
